import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcc_final_project/references_screen.dart';
import 'package:mcc_final_project/utility/config.dart';
import 'package:mcc_final_project/widget/asset_player_widget.dart';
import 'package:mcc_final_project/widget/item_news_list.dart';
import 'package:mcc_final_project/widget/widget_list.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'information_screen.dart';
import 'model/view_models_api/news_articale_listview_model.dart';
import 'model/view_models_api/news_article_view_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("topics");

  final _searchController = TextEditingController();
  Widget searchList;
  bool isSearch = false;
  String _searchError;
  ScrollController controller = ScrollController();

  bool closeTopContainer = false;
  Future<void> _onGoSearch(NewsArticleListViewModel vm) async {
    final value = _searchController.text;
    if (value.isNotEmpty) {
      setState(() {
        vm.search(value);
      });

      setState(() {
        isSearch = true;
      });
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FriendsChat()));
    } else {
      setState(() {
        _searchError = 'search is not valid';
      });
    }
  }

  getData() async {
    // CollectionReference collectionReference =
    // FirebaseFirestore.instance.collection("topics");
    // QuerySnapshot querySnapshot = await collectionReference.get();
    // List<QueryDocumentSnapshot> list = querySnapshot.docs;
    // list.forEach((element) {
    //   print(element.data());
    //   print("===========================");
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();

    super.initState();
    // Provider.of<NewsArticleListViewModel>(context, listen: false)
    //     .populateTopHeadLines();
    controller.addListener(() {
      setState(() {
        closeTopContainer = controller.offset > 10;
      });
    });
  }

  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    // Navigator.push(context, MaterialPageRoute(
    //     builder: (context) => NewsArticleDetailsPage(article: article)
    // ));
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return Align(child: Text("لم نجد نتائج !"));
      case LoadingStatus.completed:
        return SingleChildScrollView(
            child: NewsList(
          articles: vm.articles,
          onSelected: (article) {
            _showNewsArticleDetails(context, article);
          },
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
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
                  "اليوم الساعة: ${DateFormat("Hm").format(DateTime.now())}",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "القدس عاصمة فلسطين",
                  style: TextStyle(
                    fontSize: 25,
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
                                controller: _searchController,
                                onSubmitted: (value) {
                                  // fetch all the news related to the keyword
                                  if (value.isNotEmpty) {
                                    _onGoSearch(vm);
                                  }
                                },
                                decoration: InputDecoration(
                                    errorText: _searchError,
                                    border: InputBorder.none,
                                    hintText: 'ابحث في اخر الاخبار..',
                                    icon: Icon(Icons.search),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        _searchController.clear();
                                        setState(() {
                                          isSearch = false;
                                        });
                                      },
                                    )),
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
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: isSearch
                      ? _buildList(context, vm)
                      : SizedBox(
                          height: 10,
                        ),
                ),
                isSearch
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            width: SizeConfig.screenWidth,
                            alignment: Alignment.topCenter,
                            height: closeTopContainer ? 0 : 300,
                            child: Container(
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
                                          color:
                                              Color.fromRGBO(255, 203, 45, 1),
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 48,
                                    left: 16,
                                    top: 8,
                                    right: 16,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 164, 12, 0.8),
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.fill,
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: SizeConfig.screenWidth,
                                      height: 250,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 164, 12, 1),
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                      child: Card(
                                        child: AssetPlayerWidget(
                                          videoPlayerController:
                                              VideoPlayerController.network(
                                                  'https://firebasestorage.googleapis.com/v0/b/mcc-final-project-jerusalem.appspot.com/o/%D9%85%D9%88%D8%B6%D9%88%D8%B9%20%D8%B9%D9%86%20%D8%A7%D9%84%D9%82%D8%AF%D8%B3%20-%20%D9%85%D9%88%D8%B6%D9%88%D8%B9.ts?alt=media&token=c44c5445-da24-4254-b180-af327088bb1c'),
                                          looping: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            'التصنيفات',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: SizeConfig.screenHeight - 30,
                            width: SizeConfig.screenWidth,
                            child: FutureBuilder(
                              future:
                                  collectionReference.orderBy('priority').get(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return CircularProgressIndicator();
                                return ListView.builder(
                                    shrinkWrap: true,
                                    controller: controller,
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (context, item) {
                                      DocumentSnapshot topic =
                                          snapshot.data.docs[item];
                                      return Container(
                                        width:
                                            SizeConfig.safeBlockHorizontal * 75,
                                        child: GestureDetector(
                                            onTap: () {
                                              print("###" + topic['priority']);
                                              if (int.parse(
                                                      topic['priority']) ==
                                                  7) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ReferencesScreen()));
                                              } else {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InformationScreen(
                                                                topic)));
                                              }
                                            },
                                            child: DesignListItem(topic)),
                                      );
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
