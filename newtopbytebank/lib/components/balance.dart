import 'package:flutter/material.dart';
import 'package:newtopbytebank/models/balance.dart';
import 'package:provider/provider.dart';

class BalanceCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Consumer<Balance>(
          builder: (context, value, child) {
            return Text(
              value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }
}
