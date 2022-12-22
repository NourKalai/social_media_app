import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarSimple extends StatelessWidget implements PreferredSize {
  @override
  final String title;
  const AppBarSimple({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // flexibleSpace: Container(
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //           image: AssetImage('assets/images/sky.png'), fit: BoxFit.fill)),
      // ),
      backgroundColor: Colors.blue.shade900,
      title: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Center(
          child: Text(
            this.title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => AppBar();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}
