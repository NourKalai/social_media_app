import 'package:diginas_app/authentification/screens/home/feed_screen.dart';
import 'package:diginas_app/authentification/screens/home/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'models/post_model.dart';

class AddContentScreen extends StatefulWidget {
  const AddContentScreen({super.key});

  @override
  State<AddContentScreen> createState() => _AddContentScreenState();
}

class _AddContentScreenState extends State<AddContentScreen> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  final double _scrollOffset = 0.0;
  String imagepath = "assets/images/aa.png";

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 80),
          child: CustomAppBar(
            scrollOffset: _scrollOffset,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "New content",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                minLines: 2,
                maxLines: 10,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'Write something',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)))),
              ),
              image != null
                  ? Container(
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
                      child: Image.file(image!,
                          width: 200, height: 200, fit: BoxFit.cover))
                  : Container(
                      child: Center(
                          child: Text(
                        "No image",
                      )),
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
                      )),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => BottomSheet(context)),
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 4, 167, 126)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 4, 167, 126))))),
                child: Container(
                  height: 50,
                  width: 400,
                  child: Center(
                    child: const Text(
                      "upload image",
                      style: TextStyle(
                          color: Color.fromARGB(255, 244, 250, 247),
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FeedScreen()),
                  );
                  Post newPost = Post(
                      authorName: "Nour Kalai",
                      authorImageUrl: "assets/images/nan.png",
                      timeAgo: 'Now',
                      file: image!);
                  setState(() {
                    posts.add(newPost);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.transparent,
                      content: Container(
                          height: 40,
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
                          child: Center(
                            child: Text(
                              '   Posted',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              maxLines: 2,
                            ),
                          ))));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 108, 201, 65)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 76, 216, 71))))),
                child: Container(
                  height: 50,
                  width: 400,
                  child: Center(
                    child: const Text(
                      "Share",
                      style: TextStyle(
                          color: Color.fromARGB(255, 244, 250, 247),
                          fontSize: 18),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget BottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: [
        const Text(
          "Choose your content from ",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera,
                  color: Colors.green,
                ),
                label: const Text("Camera",
                    style: TextStyle(color: Colors.black))),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.photo,
                  color: Colors.green,
                ),
                label: const Text(
                  "Galerie",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        )
      ]),
    );
  }
}
