import 'package:diginas_app/authentification/screens/home/featuredScreen.dart';
import 'package:diginas_app/authentification/screens/home/notificationScreen.dart';
import 'package:diginas_app/constant/config.dart';
import 'package:diginas_app/constant/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    FeaturedScreen(),
    FeaturedScreen(),
    NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPurpleColor,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon:
                Image.asset(icFeatured, height: kBottomNavigationBarItemSize),
            icon: Image.asset(icFeaturedOutlined,
                height: kBottomNavigationBarItemSize),
            label: 'Featured',
          ),
          BottomNavigationBarItem(
            activeIcon:
                Image.asset(icLearning, height: kBottomNavigationBarItemSize),
            icon: Image.asset(icLearningOutlined,
                height: kBottomNavigationBarItemSize),
            label: 'My challenges',
          ),
          BottomNavigationBarItem(
            activeIcon:
                Image.asset(icWishlist, height: kBottomNavigationBarItemSize),
            icon: Image.asset(icWishlistOutlined,
                height: kBottomNavigationBarItemSize),
            label: 'WishList',
          ),
          BottomNavigationBarItem(
            activeIcon:
                Icon(Icons.notifications, size: kBottomNavigationBarItemSize),
            icon: Image.asset(icSettingOutlined,
                height: kBottomNavigationBarItemSize),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
