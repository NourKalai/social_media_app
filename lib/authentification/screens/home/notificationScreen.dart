import 'package:diginas_app/authentification/screens/home/widgets/appBarSimple.dart';
import 'package:diginas_app/authentification/screens/home/widgets/custom_follow_notification.dart';
import 'package:diginas_app/authentification/screens/home/widgets/custom_liked_follow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  List newItem = ["liked", "follow"];
  List todayItem = ["follow", "liked", "liked"];
  List oldesItem = ["follow", "follow", "liked", "liked"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            appBar: AppBarSimple(title: "Notification"),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: newItem.length,
                        itemBuilder: (context, index) {
                          return newItem[index] == "follow"
                              ? CustomFollowNotifcation()
                              : CustomLikedNotifcation();
                        }),
                    SizedBox(height: 10),
                    Text(
                      "Today",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: todayItem.length,
                        itemBuilder: (context, index) {
                          return todayItem[index] == "follow"
                              ? CustomFollowNotifcation()
                              : CustomLikedNotifcation();
                        }),
                    SizedBox(height: 10),
                    Text(
                      "Oldest",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: oldesItem.length,
                        itemBuilder: (context, index) {
                          return oldesItem[index] == "follow"
                              ? CustomFollowNotifcation()
                              : CustomLikedNotifcation();
                        }),
                    // CustomFollowNotifcation(),
                    // CustomLikedNotifcation()
                  ],
                ),
              ),
            )));
    ;
  }
}
