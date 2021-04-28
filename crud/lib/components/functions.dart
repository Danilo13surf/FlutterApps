import 'package:crud/screens/form_user.dart';
import 'package:flutter/material.dart';

class Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showFormularioContato(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FormularioContato(),
      ),
    );
  }
}
