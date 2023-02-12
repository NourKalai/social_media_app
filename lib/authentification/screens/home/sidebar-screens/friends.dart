import 'package:diginas_app/authentification/screens/home/widgets/appbar-research.dart';
import 'package:diginas_app/authentification/screens/home/widgets/custom_request.dart';
import 'package:flutter/material.dart';

import '../models/follow_model.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBarResearch(
                title: "Followers",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: ((context, index) {
                      return CustomRequest(follower: follows[index]);
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
