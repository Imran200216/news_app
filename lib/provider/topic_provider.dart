import 'package:flutter/material.dart';

class TopicsProvider with ChangeNotifier {
  final List<String> _selectedTopics = [];

  List<String> get selectedTopics => _selectedTopics;

  void toggleTopicSelection(String topic) {
    if (_selectedTopics.contains(topic)) {
      _selectedTopics.remove(topic);
    } else {
      _selectedTopics.add(topic);
    }
    notifyListeners();
  }

  bool isSelected(String topic) {
    return _selectedTopics.contains(topic);
  }
}
