import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcc_final_project/widget/appbar.dart';

class InformationScreen extends StatefulWidget {
  DocumentSnapshot topic;
  InformationScreen(DocumentSnapshot topic) {
    this.topic = topic;
  }

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    final double _fontSize = 40;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 191, 0, 1),
          shape: CustomShapeBorder(),
          title: Image.asset(
            'assets/mosque_1.png',
            height: 45,
            width: 50,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, right: 8, top: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.all(8),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: '${widget.topic['topicTitle']}',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'slabo',
                              fontSize: _fontSize,
                              fontWeight: FontWeight.w600)),
                    ]),
                  )),
              Container(
                height: 250,
                child: Center(
                  child: Image.network(
                    '${widget.topic['topicImage']}',
                    fit: BoxFit.contain,
                    height: 300,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "${widget.topic['topicDescription']}",
                  style: TextStyle(
                      color: Colors.black87,
                      letterSpacing: 1.3,
                      fontSize: 17,
                      textBaseline: TextBaseline.alphabetic),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
