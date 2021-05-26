import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mcc_final_project/utility/config.dart';
import 'package:mcc_final_project/widget/asset_player_widget.dart';
import 'package:mcc_final_project/widget/widget_list.dart';
import 'package:video_player/video_player.dart';

import 'information_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getData() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("topics");
    QuerySnapshot querySnapshot = await collectionReference.get();
    List<QueryDocumentSnapshot> list = querySnapshot.docs;
    list.forEach((element) {
      print(element.data());
      print("===========================");
    });
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
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Friday,February 19',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Jerusalem is Palestine's capital",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Container(
                    height: 50,
                    width: SizeConfig.screenWidth,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 8,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[300]),
                                  borderRadius: BorderRadius.circular(24)),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search anything from kods',
                                    icon: Icon(Icons.search)),
                              ),
                            )),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(255, 203, 45, 1),
                                        Color.fromRGBO(255, 145, 12, 1)
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              child: Center(
                                child: Icon(
                                  Icons.tune,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 32,
                        left: 32,
                        top: 8,
                        right: 32,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 203, 45, 1),
                              borderRadius: BorderRadius.circular(24)),
                        ),
                      ),
                      Positioned(
                        bottom: 48,
                        left: 16,
                        top: 8,
                        right: 16,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 164, 12, 0.8),
                              borderRadius: BorderRadius.circular(24)),
                        ),
                      ),
                      Positioned(
                        bottom: 64,
                        left: 0,
                        top: 8,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 164, 12, 1),
                              borderRadius: BorderRadius.circular(24)),
                          child: Card(
                            child: AssetPlayerWidget(
                              videoPlayerController: VideoPlayerController.network(
                                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
                              looping: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 180,
                  width: SizeConfig.screenWidth,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 8,
                      shrinkWrap: true,
                      itemBuilder: (context, item) {
                        return Container(
                          width: SizeConfig.safeBlockHorizontal * 75,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InformationScreen()));
                              },
                              child: DesignListItem()),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
