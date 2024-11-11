import 'package:flutter/material.dart';

class CategoryChipProvider with ChangeNotifier {
  final Map<String, bool> _selectedChips = {};

  bool isSelected(String label) => _selectedChips[label] ?? false;

  void toggleChipSelection(String label) {
    _selectedChips[label] = !(_selectedChips[label] ?? false);
    notifyListeners();
  }
}
