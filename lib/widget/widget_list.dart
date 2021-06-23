import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DesignListItem extends StatefulWidget {
  DocumentSnapshot topic;
  DesignListItem(DocumentSnapshot topic) {
    this.topic = topic;
  }

  @override
  _DesignListItemState createState() => _DesignListItemState();
}

class _DesignListItemState extends State<DesignListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 4.0,
      ),
      child: Stack(
        children: [
          Container(
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
                  '${widget.topic['topicTitle']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            bottom: 12,
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: NetworkImage('${widget.topic['topicImage']}'),
                      fit: BoxFit.cover)),
              margin: new EdgeInsets.symmetric(vertical: 10.0),
              alignment: FractionalOffset.centerLeft,
            ),
          ),
        ],
      ),
    );
  }
}
