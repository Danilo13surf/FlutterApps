import 'package:crud/providers/users.dart';
import 'package:crud/screens/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Crud());
}

class Crud extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
          title: 'Contatos',
          theme: ThemeData.dark(
              // primarySwatch: Colors.blue,
              ),
          home: UserList()),
    );
  }
}
