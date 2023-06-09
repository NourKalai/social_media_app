import 'package:diginas_app/challenger/screens/home/models/comment_model.dart';
import 'package:diginas_app/challenger/screens/home/widgets/build_comment.dart';
import 'package:diginas_app/challenger/screens/home/widgets/build_special_options.dart';
import 'package:flutter/material.dart';
import 'models/post_model.dart';

class ViewPostScreen extends StatefulWidget {
  final Post post;
  final int nLikes;
  late int nComments;

  ViewPostScreen(
      {super.key,
      required this.post,
      required this.nLikes,
      required this.nComments});

  @override
  // ignore: library_private_types_in_public_api
  _ViewPostScreenState createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  bool isLiked = false;
  bool isSaved = false;
  bool delete = false;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              width: double.infinity,
              height: 600.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              iconSize: 30.0,
                              color: Colors.black,
                              onPressed: () => Navigator.pop(context),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
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
                                        image: AssetImage(
                                            widget.post.authorImageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  widget.post.authorName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(widget.post.timeAgo),
                                trailing: IconButton(
                                  icon: const Icon(Icons.more_horiz),
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                            onDoubleTap: () {},
                            child: (widget.post.imageUrl != null)
                                ? Container(
                                    margin: const EdgeInsets.all(10.0),
                                    width: double.infinity,
                                    height: 400.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black45,
                                            offset: Offset(0, 5),
                                            blurRadius: 8.0,
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              widget.post.imageUrl!),
                                          fit: BoxFit.cover,
                                        )),
                                  )
                                : Container(
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
                                    ),
                                    child: Image.file(widget.post.file!,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover))),
                      ],
                    ),
                  ),
                  BuildSpecialOptions(
                    nLikes: widget.nLikes,
                    index: -1,
                    nComments: widget.nComments,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
                width: double.infinity,
                height: 600.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
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
                                  image: AssetImage(
                                      comments[index].authorImageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            comments[index].authorName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(comments[index].text),
                          trailing: IconButton(
                            iconSize: 30,
                            icon: (comments[index].authorName != "Nour Kalai")
                                ? (comments[index].isLiked == false)
                                    ? const Icon(
                                        Icons.favorite_border,
                                      )
                                    : const Icon(Icons.favorite,
                                        color: Colors.red)
                                : Icon(Icons.delete),
                            onPressed: () {
                              print("comment of " + comments[index].authorName);
                              print("is liked" +
                                  comments[index].isLiked.toString());
                              if (comments[index].authorName != "Nour Kalai")
                                setState(() {
                                  if (comments[index].isLiked == true)
                                    comments[index].isLiked = false;
                                  else
                                    comments[index].isLiked = true;
                                  print("now" +
                                      comments[index].isLiked.toString());
                                });
                              else {
                                setState(() {
                                  comments.removeAt(index);
                                  widget.nComments--;
                                });

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.transparent,
                                        content: Container(
                                            height: 40,
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 44, 92, 224),
                                                  Color.fromARGB(
                                                      255, 10, 238, 124),
                                                ],
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Your comment is deleted!',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                                maxLines: 2,
                                              ),
                                            ))));
                              }
                            },
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 100.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.all(20.0),
                hintText: 'Add a comment',
                prefixIcon: Container(
                  margin: const EdgeInsets.all(4.0),
                  width: 48.0,
                  height: 48.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
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
                        height: 48.0,
                        width: 48.0,
                        image: AssetImage("assets/images/nan.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(right: 4.0),
                  width: 70.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF23B66F),
                      // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      addItem(_controller.text);
                      _controller.clear();
                    },
                    child: const Icon(
                      Icons.send,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addItem(String text) {
    Comment newComment = Comment(
        authorImageUrl: "assets/images/nan.png",
        authorName: 'Nour Kalai',
        text: text);
    setState(() {
      comments.add(newComment);
      widget.nComments++;
    });
  }
}
