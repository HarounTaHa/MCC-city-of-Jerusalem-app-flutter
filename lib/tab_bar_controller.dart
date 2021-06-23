import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mcc_final_project/statistics_screen.dart';
import 'package:mcc_final_project/widget/appbar.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    Container(
                        width: 100,
                        height: 100,
                        alignment: FractionalOffset.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://avatars.githubusercontent.com/u/33500954?v=4',
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
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
                      onTap: () async {
                        // setState(() {
                        //   value == 0 ? value = 1 : value = 0;
                        // });
                        var url = "https://github.com/HarounTaHa";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw "لا نستطيع تحميل الصفحة";
                        }
                      },
                      leading: FaIcon(
                        FontAwesomeIcons.github,
                        size: 45,
                        color: Colors.black87,
                      ),
                      title: Text(
                        "Github",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        var url =
                            "https://www.linkedin.com/in/haroun-th-443a7b1a7/";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw "لا نستطيع تحميل الصفحة";
                        }
                      },
                      leading: FaIcon(
                        FontAwesomeIcons.linkedinIn,
                        size: 45,
                        color: Colors.black87,
                      ),
                      title: Text(
                        "LinkedIn",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () async {
                        var url =
                            "https://www.facebook.com/profile.php?id=100018885374274";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw "لا نستطيع تحميل الصفحة";
                        }
                      },
                      leading: FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 45,
                        color: Colors.black87,
                      ),
                      title: Text(
                        "Facebook",
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
                    ..setEntry(2, 2, 0.001)
                    ..setEntry(0, 3, -200 * val.toDouble())
                    ..rotateX((pi / 6) * val.toDouble()),
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
                            'الرئيسية',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.assessment_outlined,
                            color: Color.fromRGBO(254, 190, 14, 1),
                          ),
                          title: Text('الاحصائيات',
                              style: TextStyle(color: Colors.black)),
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.email_outlined,
                              color: Color.fromRGBO(254, 190, 14, 1)),
                          title: Text('التواصل',
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
