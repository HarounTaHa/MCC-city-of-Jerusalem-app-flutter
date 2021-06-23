import 'package:flutter/material.dart';
import 'package:mcc_final_project/utility/config.dart';

import 'chat_bot.dart';
import 'chat_stream.dart';

class CommunicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatStream()));
            },
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(92, 165, 240, 1),
                  Color.fromRGBO(5, 117, 230, 1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 8,
                        right: SizeConfig.safeBlockHorizontal * 5),
                    width: SizeConfig.safeBlockHorizontal * 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'تواصل مع الاخرين',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'تحدث مع الاخرين شارك\nرأيك وتحدث عن القدس ...',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 8,
                        right: SizeConfig.safeBlockHorizontal * 2,
                        bottom: SizeConfig.safeBlockVertical * 2,
                        left: SizeConfig.safeBlockHorizontal * 2),
                    width: SizeConfig.safeBlockHorizontal * 47,
                    height: SizeConfig.safeBlockVertical * 50,
                    child: Image.asset('assets/communications.png'),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatBot()));
            },
            child: Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight / 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(244, 107, 69, 1),
                  Color.fromRGBO(238, 168, 73, 1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 8,
                        right: SizeConfig.safeBlockHorizontal * 5),
                    width: SizeConfig.safeBlockHorizontal * 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'المتحدث الألي',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'تعلم اكثر\nعن مدينة القدس من خلال\nمحادثة الرد الالي....',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 8,
                        right: SizeConfig.safeBlockHorizontal * 2,
                        bottom: SizeConfig.safeBlockVertical * 2,
                        left: SizeConfig.safeBlockHorizontal * 2),
                    width: SizeConfig.safeBlockHorizontal * 47,
                    height: SizeConfig.safeBlockVertical * 50,
                    child: Image.asset('assets/bot.png'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
