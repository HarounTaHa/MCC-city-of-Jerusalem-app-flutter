import 'package:flutter/material.dart';

class DesignListItem extends StatelessWidget {
  final imageThumbnail = new Container(
    margin: new EdgeInsets.symmetric(vertical: 10.0),
    alignment: FractionalOffset.centerLeft,
    child: new Image(
      image: new AssetImage("assets/jerusalem_2.png"),
      height: 100.0,
      width: 130.0,
    ),
  );
  final designCard = new Container(
    height: 150.0,
    margin: new EdgeInsets.only(left: 40.0),
    decoration: new BoxDecoration(
      gradient: LinearGradient(colors: [
        Color.fromRGBO(255, 165, 13, 1),
        Color.fromRGBO(255, 203, 45, 1)
      ], begin: Alignment.bottomLeft, end: Alignment.topRight),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 5.0,
        ),
      ],
    ),
    child: Center(
      child: Container(
        margin: EdgeInsets.only(left: 30),
        child: Text(
          'Hello World!',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 4.0,
      ),
      child: Stack(
        children: [
          designCard,
          imageThumbnail,
        ],
      ),
    );
  }
}
