import 'package:dashboard_slider/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import 'dashboard/model/ItemModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String pageTitle = "Demo";
  double sliderCardHeight = 200;
  List<ItemModel> myList = [
    ItemModel(Icons.account_circle, Colors.indigo, "Title 1", 1, "0"),
    ItemModel(Icons.account_tree, Colors.blue, "Title 2", 5, "1"),
    ItemModel(Icons.woman, Colors.red, "Title 3", 10, "2")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(
        pageTitle: pageTitle,
        sliderCardHeight: sliderCardHeight,
        itemModels: myList,
        onItemSelected: (model) {
          print(model.title);
        },
      ),
    );
  }
}
