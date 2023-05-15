import 'package:diginas_app/challenger/screens/home/base_screen.dart';
import 'package:diginas_app/buisness/pages/sidebar_screens/contacts.dart';
import 'package:diginas_app/buisness/pages/sidebar_screens/notifications.dart';
import 'package:diginas_app/buisness/pages/sidebar_screens/notifications1.dart';
import 'package:diginas_app/buisness/pages/sidebar_screens/sales.dart';
import 'package:diginas_app/buisness/pages/sidebar_screens/security.dart';
import 'package:diginas_app/buisness/pages/sidebar_screens/users.dart';
import 'package:diginas_app/buisness/widget_tree.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../responsive_layouts.dart';
import 'package:diginas_app/buisness/pages/sidebar_screens/settings.dart';

class ButtonsInfo {
  String title;
  IconData icon;
  Widget page;

  ButtonsInfo({required this.title, required this.icon, required this.page});
}

class Task {
  String task;
  double taskValue;
  Color color;

  Task({required this.task, required this.taskValue, required this.color});
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Home", icon: Icons.home, page: WidgetTree()),
  ButtonsInfo(title: "Setting", icon: Icons.settings, page: SettingsScreen()),
  ButtonsInfo(
      title: "Notifications", icon: Icons.notifications, page: MarketingTree()),
  ButtonsInfo(
      title: "Contacts",
      icon: Icons.contact_phone_rounded,
      page: ContactsScreen()),
  ButtonsInfo(title: "Sales", icon: Icons.sell, page: SalesScreen()),
  ButtonsInfo(
      title: "Marketing", icon: Icons.mark_email_read, page: MarketingTree()),
  ButtonsInfo(
      title: "Security",
      icon: Icons.verified_user,
      page: const SecurityScreen()),
  ButtonsInfo(
      title: "Users",
      icon: Icons.supervised_user_circle_rounded,
      page: UsersScreen()),
  ButtonsInfo(
      title: "Switch Account",
      icon: Icons.switch_access_shortcut_rounded,
      page: BaseScreen()),
];

class DrawerPage1 extends StatefulWidget {
  @override
  _DrawerPage1State createState() => _DrawerPage1State();
}

class _DrawerPage1State extends State<DrawerPage1> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kPadding * 4),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Admin Menu",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                trailing: !ResponsiveLayout.isComputer(context)
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, color: Colors.white),
                      )
                    : null,
              ),
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.red.withOpacity(0.9),
                                  Constants.orange.withOpacity(0.9),
                                ],
                              ),
                            )
                          : BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.red.withOpacity(0.2),
                                  Constants.orange.withOpacity(0.1),
                                ],
                              ),
                            ),
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(
                            _buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      _buttonNames[index].page));
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
