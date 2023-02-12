// ignore: file_names
import 'package:diginas_app/authentification/screens/home/feed_screen.dart';
import 'package:diginas_app/authentification/screens/home/messages.dart';
import 'package:diginas_app/authentification/screens/home/notificationScreen.dart';
import 'package:diginas_app/authentification/screens/home/sidebar-screens/profileScreen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
   const FeedScreen(),
    const ChatScreen(),
    NotificationScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: kPurpleColor,
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   items: [
        bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dashboard,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  label: "",
                ),
                const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          backgroundColor: const Color(0xFF23B66F),
                        ),
                        onPressed: () {},
                        child: const Icon(
                          Icons.add,
                          size: 35.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    label: ""),
                const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    label: ""),
                const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outline,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    label: ""),
              ],
              currentIndex: _selectedIndex,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            )));
    //     BottomNavigationBarItem(
    //       activeIcon:
    //           Image.asset(icFeatured, height: kBottomNavigationBarItemSize),
    //       icon: Image.asset(icFeaturedOutlined,
    //           height: kBottomNavigationBarItemSize),
    //       label: 'Featured',
    //     ),
    //     BottomNavigationBarItem(
    //       activeIcon:
    //           Image.asset(icLearning, height: kBottomNavigationBarItemSize),
    //       icon: Image.asset(icLearningOutlined,
    //           height: kBottomNavigationBarItemSize),
    //       label: 'My challenges',
    //     ),
    //     BottomNavigationBarItem(
    //       activeIcon:
    //           Image.asset(icWishlist, height: kBottomNavigationBarItemSize),
    //       icon: Image.asset(icWishlistOutlined,
    //           height: kBottomNavigationBarItemSize),
    //       label: 'WishList',
    //     ),
    //     BottomNavigationBarItem(
    //       activeIcon: const Icon(Icons.notifications,
    //           size: kBottomNavigationBarItemSize),
    //       icon: Image.asset(icSettingOutlined,
    //           height: kBottomNavigationBarItemSize),
    //       label: 'Notifications',
    //     ),
    //   ],
    //   currentIndex: _selectedIndex,
    //   onTap: (int index) {
    //     setState(() {
    //       _selectedIndex = index;
    //     });
    //   },
    // ),
  }
}
