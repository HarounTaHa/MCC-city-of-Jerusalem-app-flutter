import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcc_final_project/utility/config.dart';
import 'package:mcc_final_project/widget/appbar.dart';
import 'package:mcc_final_project/widget/widget_list_references.dart';

class ReferencesScreen extends StatefulWidget {
  @override
  _ReferencesScreenState createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("links");

  @override
  Widget build(BuildContext context) {
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
          child: FutureBuilder(
            future: collectionReference.get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, item) {
                    DocumentSnapshot link = snapshot.data.docs[item];
                    return Container(
                      width: SizeConfig.safeBlockHorizontal * 75,
                      child: GestureDetector(
                          onTap: () {}, child: DesignListItemReferences(link)),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
