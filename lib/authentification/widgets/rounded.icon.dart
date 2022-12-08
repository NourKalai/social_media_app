import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  RoundedIcon({Key? key, required this.imageUrl, this.ontap}) : super(key: key);
  final String imageUrl;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 2), blurRadius: 0.6),
            ],
            image: DecorationImage(
              image: AssetImage(imageUrl),
            )),
      ),
    );
  }
}
