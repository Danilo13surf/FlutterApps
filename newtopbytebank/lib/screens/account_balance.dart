import 'package:flutter/material.dart';
import 'package:newtopbytebank/components/balance.dart';
import 'package:newtopbytebank/models/titles.dart';
import 'package:newtopbytebank/models/balance.dart';
import 'package:provider/provider.dart';

class AccountBalance extends StatefulWidget {
  @override
  _AccountBalanceState createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(availableBalance),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(child: BalanceCard()),
          ),
          Align(
            alignment: Alignment.center,
            child: TextFormField(
              controller: _valorController,
              decoration: InputDecoration(
                  labelText: nameValue,
                  helperText: valorZero,
                  hintStyle: TextStyle(
                    fontSize: 133.0,
                  ),
                  icon: Icon(Icons.monetization_on_sharp)),
            ),
          ),
          Consumer<Balance>(
            builder: (context, value, child) {
              return ElevatedButton(
                child: Text(addCash),
                onPressed: () {
                  final double value = double.tryParse(_valorController.text);
                  Provider.of<Balance>(context, listen: false).addvalue(value);
                },
              );
            },
          ),
          Consumer<Balance>(
            builder: (context, value, child) {
              return ElevatedButton(
                child: Text(remove),
                onPressed: () {
                  final double value = double.tryParse(_valorController.text);
                  Provider.of<Balance>(context, listen: false)
                      .removevalue(value);
                },
              );
            },
          ),
          // Consumer<Balance>(
          //   builder: (context, value, child) {
          //     return ListTile(
          //       title: Text('50'),
          //       trailing: Container(
          //         width: 100,
          //         child: Row(
          //           children: [
          //             ElevatedButton(
          //               onPressed: () {
          //                 value.addvalue(50);
          //               },
          //               child: Icon(Icons.attach_money),
          //             ),
          //             ElevatedButton(
          //               onPressed: () {
          //                 value.addvalue(100);
          //               },
          //               child: Icon(Icons.attach_money),
          //             ),
          //             ElevatedButton(
          //               onPressed: () {
          //                 value.addvalue(150);
          //               },
          //               child: Icon(Icons.attach_money),
          //             ),
          //             ElevatedButton(
          //               onPressed: () {
          //                 value.addvalue(200);
          //               },
          //               child: Icon(Icons.attach_money),
          //             ),
          //             ElevatedButton(
          //               onPressed: () {
          //                 value.addvalue(250);
          //               },
          //               child: Icon(Icons.attach_money),
          //             ),
          //             ElevatedButton(
          //               onPressed: () {
          //                 value.addvalue(300);
          //               },
          //               child: Icon(Icons.attach_money),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
