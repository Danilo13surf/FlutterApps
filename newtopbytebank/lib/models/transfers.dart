import 'package:flutter/material.dart';
import 'package:newtopbytebank/models/transferencia.dart';

class Transfers extends ChangeNotifier {
  final List<Transfer> _transfers = [];

  List<Transfer> get transfers => _transfers;

  add(Transfer newTransfer) {
    transfers.add(newTransfer);

    notifyListeners();
  }
}
