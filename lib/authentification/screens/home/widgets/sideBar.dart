import 'package:diginas_app/authentification/screens/home/sidebar-screens/friends.dart';
import 'package:diginas_app/authentification/screens/home/sidebar-screens/requestScreen.dart';
import 'package:diginas_app/authentification/screens/sign%20in/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../sidebar-screens/coinScreen.dart';
import '../sidebar-screens/favoriteScreen.dart';
import '../sidebar-screens/policiesScreen.dart';
import '../sidebar-screens/profileScreen.dart';
import '../sidebar-screens/settingsScreen.dart';
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
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 44, 92, 224),
                Color.fromARGB(255, 10, 238, 124),
              ],
            )),
          ),
          ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue.shade900,
                size: 30,
              ),
              title: Text(AppLocalizations.of(context)!.settings),
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
            title: Text(AppLocalizations.of(context)!.profile),
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
            title: Text(AppLocalizations.of(context)!.coins),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CoinScreen(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blue.shade900,
              size: 30,
            ),
            title: Text(AppLocalizations.of(context)!.friends),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FollowersScreen(),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.blue.shade900,
              size: 30,
            ),
            title: Text(AppLocalizations.of(context)!.favorite),
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
            title: Text(AppLocalizations.of(context)!.requests),
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
            title: Text(AppLocalizations.of(context)!.policies),
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
            title: Text(AppLocalizations.of(context)!.exit),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage())),
          ),
        ],
      ),
    );
  }
}
