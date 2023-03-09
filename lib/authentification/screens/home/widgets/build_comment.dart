import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/comment_model.dart';

class BuildComment extends StatefulWidget {
  final int index;
  BuildComment({
    super.key,
    required this.index,
  });

  @override
  State<BuildComment> createState() => _BuildCommentState();
}

class _BuildCommentState extends State<BuildComment> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
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
                image: AssetImage(comments[widget.index].authorImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          comments[widget.index].authorName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(comments[widget.index].text),
        trailing: IconButton(
          iconSize: 30,
          icon: (comments[widget.index].authorName != "Nour Kalai")
              ? (isLiked == false)
                  ? const Icon(
                      Icons.favorite_border,
                    )
                  : const Icon(Icons.favorite, color: Colors.red)
              : Icon(Icons.delete),
          onPressed: () {
            if (comments[widget.index].authorName != "Nour Kalai")
              setState(() {
                isLiked = !isLiked;
              });
            else {
              setState(() {
                comments.removeAt(widget.index);
          
              });
            }
          },
        ),
      ),
    );
  }

  void removeItem(int index, BuildContext context) {
    AnimatedList.of(context).removeItem(
        index,
        (context, animation) => FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: BuildComment(index: 1),
              ),
            ));
  }
}
