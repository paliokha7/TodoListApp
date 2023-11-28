import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notes extends ChangeNotifier {
  final List<String> _items = [];
  static const String _prefsKey = 'todoItems';

  List<String> get items => _items;

  Notes() {
    _loadData();
  }

  void _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedItems = prefs.getStringList(_prefsKey);
    if (savedItems != null) {
      _items.addAll(savedItems);
      notifyListeners();
    }
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, _items);
  }

  void addItem(String newItem) {
    _items.add(newItem);
    _saveData();
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    _saveData();
    notifyListeners();
  }
}
