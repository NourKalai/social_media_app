import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diginas_app/buisness/constants.dart';
import 'package:diginas_app/buisness/pages/charts/charts.dart';
import 'package:diginas_app/buisness/pages/drawer/drawer_page1.dart';
import 'package:diginas_app/buisness/pages/panel_center/panel_center_page.dart';
import 'package:diginas_app/buisness/pages/panel_left/panel_left_page.dart';
import 'package:diginas_app/buisness/pages/pannel_right/panel_right_page.dart';
import 'package:diginas_app/buisness/pages/sidebar_screens/notifications1.dart';
import 'package:diginas_app/buisness/pages/widgets/app_bar_widget.dart';
import 'package:diginas_app/buisness/responsive_layouts.dart';

import 'package:flutter/material.dart';

import '../charts/bar_chart.dart';

class MarketingTree extends StatefulWidget {
  @override
  _MarketingTreeState createState() => _MarketingTreeState();
}

class _MarketingTreeState extends State<MarketingTree> {
  int currentIndex = 1;

  List<Widget> _icons = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : AppBarWidget(),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: Marketing1(),
        tablet: Column(
          children: [
            Expanded(
              child: Chart(
                show: false,
              ),
            ),
            Expanded(child: BarChartSample2())
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: DrawerPage1()),
            Expanded(
              child: Chart(show: false),
            ),
            Expanded(child: BarChartSample2())
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage1()),
            Expanded(
              child: Chart(
                show: false,
              ),
            ),
            Expanded(
              child: BarChartSample2(),
            )
          ],
        ),
      ),
      drawer: DrawerPage1(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: currentIndex,
              backgroundColor: Constants.orange.withOpacity(0.9),
              items: _icons,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : SizedBox(),
    );
  }
}
