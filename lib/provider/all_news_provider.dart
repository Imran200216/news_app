import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllNewsProvider extends ChangeNotifier {
  List<dynamic> _posts = [];
  bool _isLoading = false;
  String? _errorMessage;

  AllNewsProvider() {
    fetchEverythingFromAPI();
  }

  List<dynamic> get posts => _posts;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  final String newsAppEveryThing =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=40480e0644cf484fbf0dab7b2d9766e5";

  // Fetch news posts from the API
  Future<void> fetchEverythingFromAPI() async {
    _setLoading(true);
    try {
      final response = await Dio().get(
        newsAppEveryThing,
      );

      // Ensure response data format matches expectations
      if (response.data['articles'] != null) {
        _posts = response.data['articles'];
      } else {
        _errorMessage = "No articles found";
      }

      _errorMessage = null; // reset error message if successful
    } catch (e) {
      _errorMessage = "Failed to load news posts: $e";
    } finally {
      _setLoading(false);
    }
  }

  // Private method to handle loading state
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
