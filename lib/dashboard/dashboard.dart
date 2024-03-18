import 'package:dashboard_slider/dashboard/model/ItemModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/my_app_bar.dart';
import 'item_row.dart';

class Dashboard extends StatefulWidget {
  const Dashboard(
      {super.key,
      required this.sliderCardHeight,
      required this.pageTitle,
      required this.itemModels,
      required this.onItemSelected});

  final String pageTitle;
  final double sliderCardHeight;
  final List<ItemModel> itemModels;

  final Function(ItemModel) onItemSelected;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.pageTitle,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: widget.sliderCardHeight,
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  ColoredBox(
                    color: Colors.red,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pageController.hasClients) {
                            _pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),
                  ),
                  ColoredBox(
                    color: Colors.blue,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pageController.hasClients) {
                            _pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: const Text('Previous'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10.0),
              elevation: 10,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.itemModels.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemRow(
                          itemModel: widget.itemModels[index],
                          onItemSelected: (model) {
                            widget.onItemSelected.call(model);
                          },
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
