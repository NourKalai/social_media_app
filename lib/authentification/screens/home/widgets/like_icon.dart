import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LikeIcon extends StatefulWidget {
  const LikeIcon({super.key});

  @override
  State<LikeIcon> createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
      future: tempFuture(),
      builder: (context, snapshot) =>
          snapshot.connectionState != ConnectionState.done
              ? Icon(
                  Icons.favorite,
                  size: 110,
                  color: Color.fromARGB(255, 18, 224, 125),
                )
              : SizedBox(),
    ));
  }

  Future<int> tempFuture() async {
    return Future.delayed(Duration(seconds: 1));
  }
}
