// ignore_for_file: library_private_types_in_public_api

import 'package:diginas_app/authentification/screens/home/models/post_model.dart';
import 'package:diginas_app/authentification/screens/home/widgets/build_post.dart';
import 'package:diginas_app/authentification/screens/home/widgets/custom_appbar_icons.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 60),
          child: CustomAppBarIcons(
            scrollOffset: _scrollOffset,
          ),
        ),
        body: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return const SizedBox(width: 10.0);
                  }
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          height: 60.0,
                          width: 60.0,
                          image: AssetImage(stories[index - 1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const BuildPost(
              index: 0,
            ),
            const BuildPost(index: 1),
          ],
        ),
      ),
    );
  }
}
