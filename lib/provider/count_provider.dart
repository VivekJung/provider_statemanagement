import 'package:flutter/foundation.dart';

//changenotifer works lika setState in global context
//to make it global this must be built/initialize on top of the material app
//ChangeNotifierProvider => create: CountProvider
class CountProvider with ChangeNotifier {
  int _count = 0;

  // initializing getter
  int get count => _count;

  void setCount() {
    _count++;
    notifyListeners();
  }
}
