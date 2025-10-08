import 'package:flutter/material.dart';

class Tipcalculatormodel extends ChangeNotifier {
  double _tipPercentage = 0.0;
  int _personCount = 1;
  double _billTotall = 0.0;

  get tipPercentage => _tipPercentage;
  get personCount => _personCount;
  get billTotall => _billTotall;

  set billTotall(double newBillTotall) {
    _billTotall = newBillTotall;
    notifyListeners();
  }

  set tipPercentage(double newTipPercentage) {
    _tipPercentage = newTipPercentage;
    notifyListeners();
  }

  void incrementPerson() {
    _personCount++;
    notifyListeners();
  }

  void decrementPerson() {
    if (_personCount > 1) {
      _personCount--;
      notifyListeners();
    }
  }

  double totalPerPerson() {
    return (_billTotall + (_billTotall * _tipPercentage)) / _personCount;
  }
}
