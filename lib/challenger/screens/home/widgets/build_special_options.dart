import 'package:diginas_app/challenger/screens/home/detailed_post_screen.dart';
import 'package:diginas_app/challenger/screens/home/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuildSpecialOptions extends StatefulWidget {
  final int index;
  late int nLikes;
  final int nComments;

  BuildSpecialOptions(
      {super.key,
      required this.nLikes,
      required this.index,
      required this.nComments});

  @override
  State<BuildSpecialOptions> createState() => _BuildSpecialOptionsState();
}

class _BuildSpecialOptionsState extends State<BuildSpecialOptions> {
  bool isSaved = false;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    iconSize: 30,
                    icon: (isLiked == false)
                        ? const Icon(
                            Icons.favorite_border,
                          )
                        : const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        if (isLiked) {
                          widget.nLikes++;
                        } else {
                          widget.nLikes--;
                        }
                      });
                    },
                  ),
                  Text(
                    widget.nLikes.toString(),
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20.0),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.chat),
                    iconSize: 30.0,
                    onPressed: () {
                      if (widget.index >= 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ViewPostScreen(
                              nComments: widget.nComments,
                              post: posts[widget.index],
                              nLikes: widget.nLikes,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Text(
                    widget.nComments.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: (isSaved == false)
                ? const Icon(Icons.bookmark_border)
                : const Icon(Icons.bookmark_outlined,
                    color: Color.fromARGB(255, 38, 206, 44)),
            iconSize: 30.0,
            onPressed: () {
              if (isSaved = true) {
                showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Added'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const <Widget>[
                            Text(
                                'This post will be saved in your favorite List.'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            style: TextStyle(
                                color: Color.fromARGB(255, 7, 187, 16)),
                            'Approve',
                            selectionColor: Color.fromARGB(255, 7, 187, 16),
                          ),
                          onPressed: () {
                            setState(() {
                              isSaved = true;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            'X',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              isSaved = false;
                            });
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
