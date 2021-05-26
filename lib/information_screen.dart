import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mcc_final_project/widget/appbar.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 191, 0, 1),
        shape: CustomShapeBorder(),
        title: Image.asset(
          'assets/mosque_1.png',
          height: 45,
          width: 50,
        ),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 8, top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 250,
              child: Center(
                child: Image.asset(
                  'assets/jerusalem_2.png',
                  fit: BoxFit.contain,
                  height: 300,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: ExpansionPanelList(
                animationDuration: Duration(milliseconds: 1000),
                dividerColor: Colors.red,
                expandedHeaderPadding:
                    EdgeInsets.only(left: 50, right: 50, top: 12),
                elevation: 1,
                children: [
                  ExpansionPanel(
                    body: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 100,
                                child: ClipOval(
                                  child: CircleAvatar(
                                    child: Image.asset(
                                      'assets/jerusalem_3.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD!  HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD!',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 15,
                                    letterSpacing: 0.3,
                                    height: 1.3),
                              ),
                            ])),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "HEROO",
                          style: TextStyle(
                            color: Color.fromRGBO(
                                new Random().nextInt(255),
                                new Random().nextInt(255),
                                new Random().nextInt(255),
                                1),
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    isExpanded: expanded,
                  ),
                  ExpansionPanel(
                    body: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 100,
                                child: ClipOval(
                                  child: CircleAvatar(
                                    child: Image.asset(
                                      'assets/jerusalem_3.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD!  HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD!',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 15,
                                    letterSpacing: 0.3,
                                    height: 1.3),
                              ),
                            ])),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "HEROO",
                          style: TextStyle(
                            color: Color.fromRGBO(
                                new Random().nextInt(255),
                                new Random().nextInt(255),
                                new Random().nextInt(255),
                                1),
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    isExpanded: expanded,
                  ),
                  ExpansionPanel(
                    body: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 100,
                                child: ClipOval(
                                  child: CircleAvatar(
                                    child: Image.asset(
                                      'assets/jerusalem_3.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD!  HEllO WORLD! HEllO WORLD! HEllO WORLD! HEllO WORLD!',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 15,
                                    letterSpacing: 0.3,
                                    height: 1.3),
                              ),
                            ])),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "HEROO",
                          style: TextStyle(
                            color: Color.fromRGBO(
                                new Random().nextInt(255),
                                new Random().nextInt(255),
                                new Random().nextInt(255),
                                1),
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    isExpanded: expanded,
                  ),
                ],
                expansionCallback: (int item, bool status) {
                  setState(() {
                    expanded = !expanded;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
