import 'package:flutter/material.dart';
import 'package:newtopbytebank/database/dao/contact_dao.dart';
import 'package:newtopbytebank/models/contact.dart';
import 'package:newtopbytebank/screens/contacts_list.dart';

class UpdateContactForm extends StatelessWidget {
  final Contact contact;

  UpdateContactForm(this.contact);

  final ContactDao _dao = ContactDao();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _accountNumber = TextEditingController();

  final TextEditingController _avatarController = TextEditingController();

  final _form = GlobalKey<FormState>();

  final Map<String, Object> _formData = {};

  void _loadFormUser(Contact contact) {
    if (contact != null) {
      _formData['id'] = contact.id;
      _formData['name'] = contact.name;
      _formData['email'] = contact.email;
      _formData['accountNumber'] = contact.accountNumber;
      _formData['AvatarUrl'] = contact.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    // _loadFormUser(contact);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextField(
                // initialValue: _formData['name'],

                controller: _nameController,
                decoration: InputDecoration(
                  labelText: contact.name,
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              TextField(
                // initialValue: _formData['email'],
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: contact.email,
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  // initialValue: _formData['accountNumber'],
                  controller: _accountNumber,
                  decoration: InputDecoration(
                    labelText: contact.accountNumber.toString(),
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  // initialValue: _formData['AvatarUrl'],
                  controller: _avatarController,
                  decoration: InputDecoration(
                    labelText: contact.avatarUrl,
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: Text('Update'),
                    onPressed: () {
                      final id = contact.id;
                      final String name = _nameController.text;
                      final String email = _emailController.text;
                      final int accountNumber =
                          int.tryParse(_accountNumber.text);
                      final String avatar = _avatarController.text;
                      // CircleAvatar(child: Icon(Icons.person));

                      if (avatar == null) {
                        CircleAvatar(
                            backgroundImage: NetworkImage(contact.avatarUrl));
                      }
                      if (email == null) {
                        final email = contact.email;
                      }
                      if (accountNumber == null) {
                        final accountNumber = contact.accountNumber;
                      }
                      if (avatar == null) {
                        final avatar = contact.avatarUrl;
                      }
                      final Contact newContact =
                          Contact(id, name, email, accountNumber, avatar);
                      _dao.updateDB(newContact);
//                       // _form.currentState.save();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ContactsListContainer(),
                        ),
                      );
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
