import 'package:diginas_app/authentification/screens/sign%20in/login.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key, required this.url, required this.name, required this.email})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
  final String url;
  final String name;
  final String email;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Welcome',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              widget.url,
              height: 200,
              width: 200,
            ),
            Text(
              widget.name,
              style: TextStyle(fontSize: 20),
            ),
            Text(widget.email, style: TextStyle(fontSize: 20)),
            SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {
                  FacebookAuth.i.logOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text('Logout')),
          ],
        ),
      ),
    );
  }
}