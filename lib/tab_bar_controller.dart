import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mcc_final_project/statistics_screen.dart';
import 'package:mcc_final_project/widget/appbar.dart';

import 'communication_screen.dart';
import 'home_screen.dart';

class TabBarController extends StatefulWidget {
  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<TabBarController> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    StatisticsScreen(),
    CommunicationScreen()
  ];
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(255, 203, 45, 1),
              Color.fromRGBO(255, 160, 12, 1)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          SafeArea(
              child: Container(
            width: 200,
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Haroun TaHa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        setState(() {
                          value == 0 ? value = 1 : value = 0;
                        });
                      },
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StatisticsScreen()));
                      },
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Statistics",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          )),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              curve: Curves.easeInExpo,
              duration: Duration(milliseconds: 400),
              builder: (BuildContext context, dynamic val, Widget child) {
                print(
                    "---------------------------------------------------------------------" +
                        val.toString());
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val.toDouble())
                    ..rotateY((pi / 6) * val.toDouble()),
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Color.fromRGBO(254, 180, 14, 1),
                      shape: CustomShapeBorder(),
                      title: Image.asset(
                        'assets/mosque_1.png',
                        height: 45,
                        width: 50,
                      ),
                      centerTitle: true,
                      leading: value == 0
                          ? IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () {
                                setState(() {
                                  value == 0 ? value = 1 : value = 0;
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                setState(() {
                                  value == 0 ? value = 1 : value = 0;
                                });
                              },
                            ),
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(Icons.notifications),
                          onPressed: () {},
                        )
                      ],
                    ),
                    body: _children[_currentIndex],
                    bottomNavigationBar: BottomNavigationBar(
                      selectedItemColor: Color.fromRGBO(254, 120, 14, 1),
                      onTap: onTabTapped,
                      currentIndex: _currentIndex,
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined,
                              color: Color.fromRGBO(254, 190, 14, 1)),
                          title: Text(
                            'Home',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.assessment_outlined,
                            color: Color.fromRGBO(254, 190, 14, 1),
                          ),
                          title: Text('Analytics',
                              style: TextStyle(color: Colors.black)),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.email_outlined,
                              color: Color.fromRGBO(254, 190, 14, 1)),
                          title: Text('Messages',
                              style: TextStyle(color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                ));
              }),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
