import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mcc_final_project/utility/config.dart';
import 'package:pie_chart/pie_chart.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              PieChart(
                centerText: "ابواب القدس",
                dataMap: {"ابواب مغلغة ": 5, "ابواب مفتوحة": 10},
                chartRadius: 200,
                colorList: [
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1)
                ],
                chartValuesOptions: ChartValuesOptions(
                    chartValueStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    showChartValueBackground: false,
                    showChartValuesInPercentage: true),
              ),
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
                colorList: [
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
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
              PieChart(
                centerText: "سكان القدس",
                dataMap: {
                  "مسلمون": 383000,
                  "مسيحيون": 8558,
                  "لم يحددوا دينهم": 43442
                },
                chartRadius: 200,
                colorList: [
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1),
                  Color.fromRGBO(new Random().nextInt(255),
                      new Random().nextInt(255), new Random().nextInt(255), 1)
                ],
                chartValuesOptions: ChartValuesOptions(
                    chartValueStyle: TextStyle(
                        fontSize: 11,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('للتعرف على المزيد ...'),
                        Text('URL>>>>>>>>>>>>>>>')
                      ],
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
