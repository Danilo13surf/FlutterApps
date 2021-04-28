import 'package:crud/components/functions.dart';
import 'package:crud/components/user_tile.dart';
import 'package:crud/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final Screens pag = Screens();

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pag.showFormularioContato(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
