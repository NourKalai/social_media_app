import 'package:diginas_app/authentification/screens/home/models/comment_model.dart';
import 'package:diginas_app/authentification/screens/home/widgets/build_special_options.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../detailed_post_screen.dart';

class BuildPost extends StatefulWidget {
  final int index;
  const BuildPost({required this.index, super.key});

  @override
  State<BuildPost> createState() => _BuildPostState();
}

class _BuildPostState extends State<BuildPost> {
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
  bool isLiked = false;
  int nLikes = 1200;
  bool isSaved = false;
  final items = ['share', 'save', 'hide'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 560.0,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
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
                            height: 50.0,
                            width: 50.0,
                            image:
                                AssetImage(posts[widget.index].authorImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      posts[widget.index].authorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(posts[widget.index].timeAgo),
                    trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.share,
                                    color: Colors.green,
                                  ),
                                  Text("Share")
                                ],
                              )),
                              PopupMenuItem(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                        color: Colors.green, Icons.save_alt),
                                  ),
                                  Text("Save")
                                ],
                              ))
                            ],
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                          ),
                        )),
                  ),
                  InkWell(
                    onDoubleTap: () {},
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewPostScreen(
                            nComments: comments.length,
                            nLikes: nLikes,
                            post: posts[widget.index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 400.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(posts[widget.index].imageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  BuildSpecialOptions(
                    nLikes: nLikes,
                    index: widget.index,
                    nComments: comments.length,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
