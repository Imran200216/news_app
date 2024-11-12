import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/helper/toast_helper.dart';
import 'package:news_app/modals/user_modals.dart';
import 'package:news_app/screens/bottom_nav.dart';
import 'package:news_app/screens/get_started_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// loading state
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  /// Save login state
  Future<void> _saveLoginState(bool isLoggedIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  /// sign in with google
  Future<User?> signInWithGoogle(BuildContext context) async {
    _setLoading(true);
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _setLoading(false); // User canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        UserModal userModal = UserModal(
          uid: user.uid,
          userName: user.displayName,
          userEmail: user.email,
          userPhotoURL: user.photoURL,
        );

        await _firestore
            .collection('userByGoogleAuth')
            .doc(user.uid)
            .set(userModal.toJson());

        await _saveLoginState(true); // Save login state

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavBar(),
          ),
          (route) => false,
        );

        ToastHelper.showSuccessToast(
          context: context,
          message: "Successfully signed in and saved to Firestore",
        );

        return user;
      } else {
        ToastHelper.showErrorToast(
          context: context,
          message: "User sign-in failed",
        );
        return null;
      }
    } catch (e) {
      ToastHelper.showErrorToast(
        context: context,
        message: "Google Sign-In error: $e",
      );
      return null;
    } finally {
      _setLoading(false);
    }
  }

  /// Sign up with Google (for new users)
  Future<User?> signUpWithGoogle(BuildContext context) async {
    _setLoading(true);
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _setLoading(false); // User canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // Check if the user already exists in Firestore
        final userDoc =
            await _firestore.collection('userByGoogleAuth').doc(user.uid).get();
        if (!userDoc.exists) {
          // New user: Save profile to Firestore and navigate to the avatar screen
          UserModal userModal = UserModal(
            uid: user.uid,
            userName: user.displayName,
            userEmail: user.email,
            userPhotoURL: user.photoURL,
          );
          await _firestore
              .collection('userByGoogleAuth')
              .doc(user.uid)
              .set(userModal.toJson());

          await _saveLoginState(true);

          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => GoogleUserAvatarScreen(userId: user.uid),
          //   ),
          //       (route) => false,
          // );

          ToastHelper.showSuccessToast(
            context: context,
            message: "Successfully signed up with Google",
          );

          return user;
        } else {
          ToastHelper.showErrorToast(
            context: context,
            message: "User already exists. Please sign in.",
          );
          return null;
        }
      } else {
        ToastHelper.showErrorToast(
          context: context,
          message: "Google Sign-Up failed",
        );
        return null;
      }
    } catch (e) {
      ToastHelper.showErrorToast(
        context: context,
        message: "Google Sign-Up error: $e",
      );
      return null;
    } finally {
      _setLoading(false);
    }
  }

  /// sign out with google
  Future<void> signOut(BuildContext context) async {
    _setLoading(true);
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();

      await _saveLoginState(false); // Clear login state

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStartedScreen()),
      );

      ToastHelper.showSuccessToast(
        context: context,
        message: "Successfully signed out",
      );
    } catch (e) {
      ToastHelper.showErrorToast(
        context: context,
        message: "Sign-out failed: $e",
      );
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// Check if user is logged in
  Future<bool> isUserGoogleLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
