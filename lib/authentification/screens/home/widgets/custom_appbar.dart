import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../sidebar-screens/supporterScreen.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({super.key, this.scrollOffset = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24.0),
      color:
          Colors.white.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Row(
        children: [
          Image.asset("assets/images/nature1.png"),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                    widget: Text("Reels",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    onTap: () {
                      print("in reels");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SupporterScreen()),
                      );
                      ;
                    }),
                SizedBox(width: 30),
                _AppBarButton(
                    widget: Text("Supporters",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    onTap: () => print('Supportes')),
                SizedBox(width: 30),
                _AppBarButton(
                    widget: Text("Others",
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    onTap: () => print("others")),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final Widget widget;

  final Function onTap;
  const _AppBarButton({Key? key, required this.widget, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => onTap, child: widget);
  }
}
