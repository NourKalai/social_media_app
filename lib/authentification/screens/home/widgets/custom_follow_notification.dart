import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'custom_button.dart';

class CustomFollowNotifcation extends StatefulWidget {
  const CustomFollowNotifcation({Key? key}) : super(key: key);

  @override
  State<CustomFollowNotifcation> createState() =>
      _CustomFollowNotifcationState();
}

class _CustomFollowNotifcationState extends State<CustomFollowNotifcation> {
  bool follow = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: const AssetImage("assets/images/nan.png"),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text("Rihen Houli", style: Theme.of(context).textTheme.titleLarge
                //     .copyWith(color: Colors.black),
                ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "New following you .15am",
              // style: Theme.of(context)
              //     .textTheme
              //     .subtitle1!
              //     .copyWith(color: Colors.black),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: follow == false ? 30 : 20),
            child: CustomButton(
              height: 40,
              color: follow == false
                  ? Color.fromARGB(255, 12, 120, 221)
                  : Color.fromARGB(255, 238, 234, 234),
              textColor: follow == false ? Colors.white : Colors.black,
              onTap: () {
                setState(() {
                  follow = !follow;
                });
              },
              text: "Follow",
            ),
          ),
        ),
      ],
    );
  }
}
