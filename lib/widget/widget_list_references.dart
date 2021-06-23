import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mcc_final_project/utility/config.dart';
import 'package:url_launcher/url_launcher.dart';

class DesignListItemReferences extends StatefulWidget {
  DocumentSnapshot link;
  DesignListItemReferences(DocumentSnapshot link) {
    this.link = link;
  }

  @override
  _ReferencesState createState() => _ReferencesState();
}

class _ReferencesState extends State<DesignListItemReferences> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                text: '${widget.link['linkTitle']} ',
              ),
              TextSpan(
                  style: TextStyle(fontSize: 20, color: Colors.blue[300]),
                  text: "اقرأ المزيد",
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () async {
                      var url = "${widget.link['link']}";
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
    );
  }
}
