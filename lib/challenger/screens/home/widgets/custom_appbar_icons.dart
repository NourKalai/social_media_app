import 'package:flutter/material.dart';
import '../base_screen.dart';
import '../messages.dart';
import '../sidebar-screens/supporter_screen.dart';

class CustomAppBarIcons extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBarIcons({super.key, this.scrollOffset = 0});
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
      color:
          Colors.white.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BaseScreen()),
                );
              },
              child: Image.asset("assets/images/nature1.png")),
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(left: screenSize.width * 0.50, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _AppBarButton(
                    widget: Container(
                      width: 20,
                      child: IconButton(
                        icon: const Icon(
                          Icons.send,
                          size: 30,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: _AppBarButton(
                      widget: Container(
                        width: 20,
                        child: IconButton(
                          icon: const Icon(
                            Icons.live_tv,
                            size: 30,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SupporterScreen()),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final Widget widget;

  final Function? onTap;
  const _AppBarButton({required this.widget, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => onTap, child: widget);
  }
}
