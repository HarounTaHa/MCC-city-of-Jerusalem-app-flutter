import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:intl/intl.dart';
import 'package:mcc_final_project/services/text_to_speech.dart';
import 'package:mcc_final_project/widget/appbar.dart';

class ChatBot extends StatefulWidget {
  ChatBot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  String _text;
  final myController = TextEditingController();

  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/service.json").build();

    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    print("############${authGoogle.scope.length}#################");
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    print("############${aiResponse.queryResult}#################");
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
      IBMService().textToSpeech(
          aiResponse.getListMessage()[0]["text"]["text"][0].toString());
    });
    print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = List();

  @override
  void initState() {
    super.initState();
  }

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
        leading: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 35),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "اليوم الساعة: ${DateFormat("Hm").format(DateTime.now())}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) {
                      return chat(messsages[index]["message"].toString(),
                          messsages[index]["data"]);
                    })),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 5.0,
              color: Color.fromRGBO(255, 203, 45, 1),
            ),
            Container(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                    color: Color.fromRGBO(255, 164, 12, 0.8),
                    size: 35,
                  ),
                ),
                title: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                  padding: EdgeInsets.only(left: 15),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 12,
                    ),
                    child: TextFormField(
                      controller: messageInsert,
                      decoration: InputDecoration(
                        hintText: "اكتب هنا...",
                        hintStyle: TextStyle(color: Colors.black26),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 30.0,
                      color: Color.fromRGBO(255, 164, 12, 0.8),
                    ),
                    onPressed: () {
                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                      } else {
                        setState(() {
                          messsages.insert(
                              0, {"data": 1, "message": messageInsert.text});
                          IBMService().textToSpeech(messageInsert.text);
                        });
                        print(
                            "############ ${messageInsert.text}###########################");
                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }),
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment:
            data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0
              ? Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/bot.png"),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(15.0),
                color: data == 0 ? Colors.orangeAccent : Colors.blueAccent,
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          message,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ))
                    ],
                  ),
                )),
          ),
          data == 1
              ? Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/bot.png"),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
