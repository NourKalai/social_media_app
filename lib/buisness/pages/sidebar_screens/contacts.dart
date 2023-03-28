import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diginas_app/buisness/constants.dart';
import 'package:flutter/material.dart';

import '../../../authentification/screens/home/widgets/appbar_simple.dart';
import '../../responsive_layouts.dart';
import '../drawer/drawer_page1.dart';
import '../panel_center/panel_center_page.dart';
import '../panel_left/panel_left_page.dart';
import '../pannel_right/panel_right_page.dart';
import '../widgets/app_bar_widget.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
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
            ? PanelLeftPage()
            : currentIndex == 1
                ? PanelCenterPage()
                : PanelRightPage(),
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
            Expanded(
              child: Scaffold(
                body: Container(
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      drawer: DrawerPage1(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: currentIndex,
              backgroundColor: Constants.purpleDark,
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
