import 'package:animation/screens/home/widgets/list_data.dart';
import 'package:flutter/material.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listSlidePosition;

  AnimatedListView({@required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: "Estudar Flutter",
          subtitle: "Com o curso do Daniel Ciolfi",
          image: AssetImage("images/perfil.jpg"),
          margin: listSlidePosition.value * 5,
        ),
        ListData(
          title: "Estudar Flutter",
          subtitle: "Com o a Alura",
          image: AssetImage("images/perfil.jpg"),
          margin: listSlidePosition.value * 4,
        ),
        ListData(
          title: "Estudar Flutter",
          subtitle: "Com a Udemy",
          image: AssetImage("images/perfil.jpg"),
          margin: listSlidePosition.value * 3,
        ),
        ListData(
          title: "Estudar IOS",
          subtitle: "Com a Alura",
          image: AssetImage("images/perfil.jpg"),
          margin: listSlidePosition.value * 2,
        ),
      ],
    );
  }
}
