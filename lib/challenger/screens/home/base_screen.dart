// ignore: file_names
import 'package:diginas_app/challenger/screens/home/add_content.dart';
import 'package:diginas_app/challenger/screens/home/feed_screen.dart';
import 'package:diginas_app/challenger/screens/home/messages.dart';
import 'package:diginas_app/challenger/screens/home/notification_screen.dart';
import 'package:diginas_app/challenger/screens/home/sidebar-screens/profile_screen.dart';
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
    const ProfileScreen(
      name: 'Nour Kalai',
      image: "assets/images/nan.png",
    )
  ];

  @override
  Widget build(BuildContext context) {
    Future<void> _showAlertDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            // <-- SEE HERE
            title: const Text('Add'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                  Text('Are you sure want to cancel booking?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),),
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
                        onPressed:(){ Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>AddContentScreen()
                        ),
                      );},
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
  }
}
