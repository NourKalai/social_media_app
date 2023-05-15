import 'package:diginas_app/challenger/screens/sign%20in/login_screen.dart';
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
        title: const Center(
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
              style: const TextStyle(fontSize: 20),
            ),
            Text(widget.email, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {
                  FacebookAuth.i.logOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
