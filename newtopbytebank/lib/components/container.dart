import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BlocContainer extends StatelessWidget {}

void push(BuildContext bloccontext, BlocContainer container) {
  Navigator.of(bloccontext).push(
    MaterialPageRoute(
      builder: (context) => container,
    ),
  );
}
