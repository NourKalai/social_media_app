import 'package:diginas_app/authentification/screens/home/widgets/searchTextField.dart';
import 'package:flutter/material.dart';
class AppbarWidget extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldKey;
  String? title;
  AppbarWidget({Key? key, this.scaffoldKey,this.title}) : super(key: key);
  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 44, 92, 224),
              Color.fromARGB(255, 10, 238, 124),
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                   widget.title!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  // CircleButton(
                  //     color: Colors.white,
                  //     icon: Icons.notifications,
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => NotificationScreen()));
                  //     }),
                ],
              ),
            ),
            const SizedBox(height: 20),
             SearchTextField(title:"Search your topic"),
          ],
        ),
      ),
    );
  }
}
