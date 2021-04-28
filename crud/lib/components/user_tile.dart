import 'package:crud/components/functions.dart';
import 'package:crud/models/users.dart';
import 'package:crud/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatefulWidget {
  final User user;

  UserTile(this.user);

  @override
  _UserTileState createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    final avatar = widget.user.avatarUrl == null ||
            widget.user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(widget.user.avatarUrl));
    final Users users = Provider.of(context);
    final Screens pag = Screens();

    return ListTile(
      leading: avatar,
      title: Text(widget.user.name),
      subtitle: Text(widget.user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.green,
              onPressed: () {
                pag.showFormularioContato(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                users.remove(widget.user);
              },
            ),
          ],
        ),
      ),
    );
  }
}
