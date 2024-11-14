import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/debounce_helper.dart';
import 'package:news_app/helper/toast_helper.dart';
import 'package:uuid/uuid.dart';

class BookMarkProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> _bookmarkedArticleIds = [];

  // Debounce helper to prevent multiple fast clicks
  final DebounceHelper _debounceHelper = DebounceHelper();

  // Stream that listens to the bookmarks collection
  Stream<List<Map<String, dynamic>>> getBookmarksStream() {
    User? user = _auth.currentUser;
    if (user != null) {
      return FirebaseFirestore.instance
          .collection('bookmarks')
          .where('userUid', isEqualTo: user.uid)
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((doc) => doc.data()).toList();
      });
    }
    return Stream.value([]); // Return an empty list if no user is logged in
  }

  List<String> get bookmarkedArticleIds => _bookmarkedArticleIds;

  BookMarkProvider() {
    _loadBookmarkedArticles();
  }

  // Fetch the list of bookmarked articles for the current user
  Future<void> _loadBookmarkedArticles() async {
    User? user = _auth.currentUser;
    if (user != null) {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('bookmarks')
          .where('userUid', isEqualTo: user.uid)
          .get();

      _bookmarkedArticleIds.clear();
      for (var doc in snapshot.docs) {
        _bookmarkedArticleIds.add(doc['articleId'] as String);
      }

      notifyListeners();
    }
  }

  // Add an article to bookmarks and persist it in Firestore with debounce
  Future<void> addBookmark(String articleId, BuildContext context) async {
    if (_debounceHelper.isDebounced()) return;

    _debounceHelper.activateDebounce(duration: const Duration(seconds: 2));

    User? user = _auth.currentUser;
    if (user != null) {
      // Check if the article is already bookmarked
      if (_bookmarkedArticleIds.contains(articleId)) {
        ToastHelper.showSuccessToast(
          context: context,
          message: "Article already added to Bookmarks",
        );
        return;
      }

      // Generate unique articleId if not already present
      String uniqueArticleId = const Uuid().v4();

      // Add the unique articleId to the list of bookmarked articles
      _bookmarkedArticleIds.add(uniqueArticleId);

      // Persist the bookmark in Firestore
      await FirebaseFirestore.instance.collection('bookmarks').add({
        "userUid": user.uid,
        "articleId": uniqueArticleId,
      });

      // Show success toast
      ToastHelper.showSuccessToast(
        context: context,
        message: "Article added to Bookmarks",
      );

      notifyListeners();
    }
  }

  // Remove an article from bookmarks and update Firestore with debounce
  Future<void> removeBookmark(String articleId, BuildContext context) async {
    if (_debounceHelper.isDebounced()) return;

    _debounceHelper.activateDebounce(duration: const Duration(seconds: 2));

    User? user = _auth.currentUser;
    if (user != null && _bookmarkedArticleIds.contains(articleId)) {
      _bookmarkedArticleIds.remove(articleId);

      // Remove from Firestore
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('bookmarks')
          .where('userUid', isEqualTo: user.uid)
          .where('articleId', isEqualTo: articleId)
          .get();

      for (var doc in snapshot.docs) {
        await FirebaseFirestore.instance
            .collection('bookmarks')
            .doc(doc.id)
            .delete();
      }

      // Show remove toast
      ToastHelper.showSuccessToast(
        context: context,
        message: "Article removed from Bookmarks",
      );

      notifyListeners();
    }
  }

  bool isBookmarked(String articleId) {
    return _bookmarkedArticleIds.contains(articleId);
  }
}
