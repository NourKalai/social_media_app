import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diginas_app/buisness/pages/drawer/drawer_page1.dart';
import 'package:diginas_app/buisness/pages/panel_center/panel_center_page.dart';
import 'package:diginas_app/buisness/pages/panel_left/panel_left_page.dart';
import 'package:diginas_app/buisness/pages/pannel_right/panel_right_page.dart';
import 'package:diginas_app/buisness/pages/widgets/app_bar_widget.dart';
import 'package:diginas_app/buisness/responsive_layouts.dart';

import 'package:flutter/material.dart';

import 'constants.dart';

class WidgetTree extends StatefulWidget {
  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
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
        preferredSize: Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : AppBarWidget(),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? Expanded(child: PanelLeftPage())
            : currentIndex == 1
                ? Expanded(child: PanelCenterPage())
                : Expanded(child: PanelRightPage()),
        tablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(
              child: PanelCenterPage(),
            )
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: PanelLeftPage()),
            Expanded(child: PanelCenterPage()),
            Expanded(
              child: PanelRightPage(),
            )
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage1()),
            Expanded(child: PanelLeftPage()),
            Expanded(
              child: PanelCenterPage(),
            ),
            Expanded(
              child: PanelRightPage(),
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
