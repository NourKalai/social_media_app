import 'package:flutter/material.dart';

class AppBarSimple extends StatelessWidget implements PreferredSize {
  final String title;
  const AppBarSimple({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      // leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: Colors.white,
      //     ),
      //     onPressed: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => const FeaturedScreen()),
      //         )),
    );
  }

  @override
  // ignore: todo
  // TODO: implement child
  Widget get child => AppBar();

  @override
  // ignore: todo
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}
