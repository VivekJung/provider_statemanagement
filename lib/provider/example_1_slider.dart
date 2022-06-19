import 'package:flutter/foundation.dart';

class ExampleOneSliderProvider with ChangeNotifier {
  double _value = 1.0;
  double get value => _value;

  setValue(double val) {
    _value = val;
    notifyListeners();
  }
}
