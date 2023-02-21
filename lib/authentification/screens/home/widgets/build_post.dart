import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:diginas_app/authentification/screens/home/models/comment_model.dart';
import 'package:diginas_app/authentification/screens/home/widgets/build_special_options.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/files.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/post_model.dart';
import '../detailed_post_screen.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class BuildPost extends StatefulWidget {
  final int index;
  const BuildPost({required this.index, super.key});

  @override
  State<BuildPost> createState() => _BuildPostState();
}

class _BuildPostState extends State<BuildPost> {
  void saveImage(var path) async {
    print(path);
    await GallerySaver.saveImage(path, toDcim: true, albumName: "NoorApp");
  }

  var album_name = "NoorApp";
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
                            fit: BoxFit.fill,
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
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () async {
                                final url =
                                    Uri.parse(posts[widget.index].imageUrl);
                                final response = await http.get(url);
                                final bytes = response.bodyBytes;
                                final temp = await getTemporaryDirectory();
                                final path = '${temp.path}/image.jpg';
                                File(path).writeAsBytesSync(bytes);
                                await Share.shareFiles([path],
                                    text: 'Look at this');
                              },
                              icon: const Icon(
                                Icons.share,
                                color: Colors.green,
                              ),
                            ),
                            const Text("Share")
                          ],
                        )),
                        PopupMenuItem(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                print("save picture");
                                //  saveImage(posts[widget.index].imageUrl);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Stack(children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      height: 70,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 44, 92, 224),
                                            Color.fromARGB(255, 10, 238, 124),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 48),
                                          Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    'Saved successfully!',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    'You can find this picture on your device.',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        top: 15,
                                        left: 8,
                                        child: SvgPicture.asset(
                                          "assets/svg/mail.svg",
                                          height: 40,
                                          width: 45,
                                        ))
                                  ]),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ));
                              },
                              icon: const Icon(
                                  color: Colors.green, Icons.save_alt),
                            ),
                            const Text("Save")
                          ],
                        ))
                      ],
                    ),
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
                          image: NetworkImage(posts[widget.index].imageUrl),
                          fit: BoxFit.cover,
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
