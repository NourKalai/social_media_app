import 'package:diginas_app/authentification/screens/home/sidebar-screens/requestScreen.dart';
import 'package:diginas_app/authentification/screens/sign%20in/login.screen.dart';
import 'package:flutter/material.dart';

import '../sidebar-screens/coinsScreen.dart';
import '../sidebar-screens/favoriteScreen.dart';
import '../sidebar-screens/policiesScreen.dart';
import '../sidebar-screens/profileScreen.dart';
import '../sidebar-screens/settingsScreen.dart';
import '../sidebar-screens/supporterScreen.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Nour Kalai'),
            accountEmail: const Text('nourkalai@yahoo.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.asset("assets/images/nan.png",
                      width: 90, height: 90, fit: BoxFit.cover)),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/sky.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue.shade900,
                size: 30,
              ),
              title: const Text('Settings'),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  )),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.blue.shade900,
              size: 30,
            ),
            title: const Text('Profile'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.currency_exchange_outlined,
              color: Colors.blue.shade900,
              size: 30,
            ),
            title: const Text('Coins'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CoinsScreen(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blue.shade900,
              size: 30,
            ),
            title: const Text('Friends'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SupporterScreen(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.blue.shade900,
              size: 30,
            ),
            title: const Text('Favorite'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoriteScreen(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.blue.shade900,
              size: 30,
            ),
            title: const Text('Requests'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RequestScreen())),
            trailing: Container(
              color: Colors.red,
              width: 20,
              height: 20,
              child: const Center(
                child: Text('10',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.description,
              color: Colors.blue.shade900,
              size: 30,
            ),
            title: const Text('Policies'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PoliciesScreen(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.blue.shade900,
              size: 30,
            ),
            title: const Text('Exit'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const LoginPage())),
          ),
        ],
      ),
    );
  }
}
