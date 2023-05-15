import 'package:diginas_app/challenger/screens/home/widgets/appbar_simple.dart';
import 'package:diginas_app/challenger/screens/home/widgets/custom_follow_notification.dart';
import 'package:diginas_app/challenger/screens/home/widgets/custom_liked_follow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final List newItem = ["liked", "follow"];
  final List todayItem = ["follow", "liked", "liked"];
  final List oldesItem = ["follow", "follow", "liked", "liked"];

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            appBar: AppBarSimple(
                title: AppLocalizations.of(context)!.notifications),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.neww,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: newItem.length,
                        itemBuilder: (context, index) {
                          return newItem[index] == "follow"
                              ? const CustomFollowNotifcation()
                              : const CustomLikedNotifcation();
                        }),
                    const SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.today,
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
                              ? const CustomFollowNotifcation()
                              : const CustomLikedNotifcation();
                        }),
                    const SizedBox(height: 10),
                    Text(
                      AppLocalizations.of(context)!.oldest,
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
                              ? const CustomFollowNotifcation()
                              : const CustomLikedNotifcation();
                        }),
                    // CustomFollowNotifcation(),
                    // CustomLikedNotifcation()
                  ],
                ),
              ),
            )));
  }
}
