import 'package:flutter/material.dart';
import '../sidebar-screens/supporter_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({super.key, this.scrollOffset = 0});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24.0),
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
                    widget: Text(AppLocalizations.of(context)!.reels,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SupporterScreen()),
                      );
                    }),
                const SizedBox(width: 30),
                _AppBarButton(
                    widget: Text(AppLocalizations.of(context)!.supporters,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    onTap: () {}),
                const SizedBox(width: 30),
                _AppBarButton(
                    widget: Text(AppLocalizations.of(context)!.others,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    onTap: () {}),
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
  const _AppBarButton({required this.widget, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => onTap, child: widget);
  }
}
