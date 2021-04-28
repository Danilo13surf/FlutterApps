import 'package:flutter/material.dart';
import 'package:newtopbytebank/screens/transaction_form.dart';
import 'package:newtopbytebank/screens/transaction_form.dart';
import 'package:newtopbytebank/screens/transaction_form.dart';

class Balance extends ChangeNotifier {
  double valueB;

  Balance(this.valueB);

  void addvalue(double valueB) {
    assert(valueB != null);
    this.valueB += valueB;

    notifyListeners();
  }

  void removevalue(double valueB) {
    // assert(valueB > 0);
    // assert(valueB <= -100);

    this.valueB -= valueB;

    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $valueB';
  }
}
