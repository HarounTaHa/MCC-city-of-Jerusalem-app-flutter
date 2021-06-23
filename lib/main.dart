import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mcc_final_project/model/view_models_api/news_articale_listview_model.dart';
import 'package:mcc_final_project/tab_bar_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppJerusalem());
}

class AppJerusalem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsArticleListViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jerusalem City',
        home: Directionality(
            textDirection: TextDirection.rtl, child: TabBarController()),
      ),
    );
  }
}
