import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mcc_final_project/utility/config.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  var statisticsTitles = List();
  String statisticsSubTitle1;
  String statisticsSubTitle2;
  double statisticsSubTitle1num;
  double statisticsSubTitle2num;

  getData() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("statistics");
    QuerySnapshot querySnapshot =
        await collectionReference.orderBy('priority').get();
    List<QueryDocumentSnapshot> list = querySnapshot.docs;
    list.forEach((element) {
      statisticsTitles.add(element.data()['statisticsTitle']);
      if (int.parse(element.data()['priority']) == 1) {
        statisticsSubTitle1 = element.data()['statisticsSubTitle1'];
        statisticsSubTitle2 = element.data()['statisticsSubTitle2'];
        statisticsSubTitle1num =
            element.data()['statisticsSubTitle1num'].toDouble();
        statisticsSubTitle2num =
            element.data()['statisticsSubTitle2num'].toDouble();
        //------------------------------------------------------------
      }
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState

    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return statisticsSubTitle2num == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 8.0, top: 8.0),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Text(
                          "الاحصائيات",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    PieChart(
                      centerText: statisticsTitles[0] == null
                          ? ""
                          : statisticsTitles[0],
                      dataMap: {
                        statisticsSubTitle1: statisticsSubTitle1num,
                        statisticsSubTitle2: statisticsSubTitle2num
                      },
                      legendOptions: LegendOptions(
                          legendPosition: LegendPosition.left,
                          legendTextStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                      chartRadius: 200,
                      colorList: [
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                      ],
                      chartValuesOptions: ChartValuesOptions(
                          chartValueStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          showChartValueBackground: false,
                          showChartValuesInPercentage: true),
                    ),
                    SizedBox(height: 10),
                    PieChart(
                      chartType: ChartType.ring,
                      centerText: 'ابواب القدس',
                      dataMap: {
                        "باب العمود": 1,
                        "باب الساهرة": 1,
                        "باب الأسباط": 1,
                        "باب المغاربة": 1,
                        "باب النبي داود": 1,
                        "باب الخليل": 1,
                        "الباب الجديد": 1,
                      },
                      chartRadius: 200,
                      legendOptions: LegendOptions(
                          legendPosition: LegendPosition.left,
                          legendTextStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                      colorList: [
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                      ],
                      chartValuesOptions: ChartValuesOptions(
                          chartValueStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                          showChartValueBackground: false,
                          showChartValuesOutside: false,
                          showChartValues: false,
                          showChartValuesInPercentage: false),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PieChart(
                      centerText: "سكان القدس",
                      dataMap: {
                        "مسلمون": 336000,
                        "مسيحيون": 22050,
                        "لم يحددوت دينهم بعد": 43442
                      },
                      chartRadius: 200,
                      legendOptions: LegendOptions(
                          legendPosition: LegendPosition.left,
                          legendTextStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                      colorList: [
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1),
                        Color.fromRGBO(
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            new Random().nextInt(255),
                            1)
                      ],
                      chartValuesOptions: ChartValuesOptions(
                          chartValueStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          showChartValueBackground: false,
                          showChartValuesInPercentage: true),
                    ),
                    Container(
                      width: SizeConfig.screenWidth,
                      padding: EdgeInsets.all(10),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                                text: 'التركيبة السكانيّة للقدس ',
                              ),
                              TextSpan(
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue[300]),
                                  text: "اقرأ المزيد",
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () async {
                                      var url =
                                          "https://ar.wikipedia.org/wiki/%D8%A7%D9%84%D9%82%D8%AF%D8%B3#%D8%A7%D9%84%D8%AA%D8%B1%D9%83%D9%8A%D8%A8%D8%A9_%D8%A7%D9%84%D8%B3%D9%83%D8%A7%D9%86%D9%8A%D9%91%D8%A9";
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw "لا نستطيع تحميل الصفحة";
                                      }
                                    }),
                            ]),
                          ),
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
