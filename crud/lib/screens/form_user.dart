import 'package:crud/models/users.dart';
import 'package:crud/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioContato extends StatefulWidget {
  @override
  _FormularioContatoState createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _avatarController = TextEditingController();

  final _form = GlobalKey<FormState>();

  final Map<String, Object> _formData = {};

  void _loadFormUser(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['AvatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
     User user;
    _loadFormUser(user);
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                controller: _nameController,
                onChanged: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'Full name',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  initialValue: _formData['Email'],
                  controller: _emailController,

                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  // keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  initialValue: _formData['AvatarUrl'],
                  controller: _avatarController,
                  decoration: InputDecoration(
                    labelText: 'Url Avatar',
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  // keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: Text('Create'),
                    onPressed: () {
                      final String name = _nameController.text;
                      final String email = _emailController.text;
                      final String avatarUrl = _avatarController.text;
                      final User user = User(
                        email: email,
                        name: name,
                        avatarUrl: avatarUrl,
                      );
                      users.put(user);
                      _form.currentState.save();

                      Navigator.pop(context);

                      // (user).then((id) => Navigator.pop(context));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
