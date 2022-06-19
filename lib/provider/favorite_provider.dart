import 'dart:developer';

import 'package:flutter/foundation.dart';

class FavoriteItemProvider with ChangeNotifier {
  final List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItems(int value) {
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItems(int value) {
    _selectedItem.remove(value);

    notifyListeners();
  }
}
