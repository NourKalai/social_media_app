import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/nan.png"),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Rihen Houli",
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "New following you .15am",
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: follow == false ? 20 : 10),
            child: CustomButton(
              height: 40,
              color: follow == false
                  ? const Color.fromARGB(255, 10, 238, 124)
                  : const Color.fromARGB(255, 238, 234, 234),
              textColor: follow == false ? Colors.white : Colors.black,
              onTap: () {
                setState(() {
                  follow = !follow;
                });
              },
              text: "Follow",
            ),
          ),
        ],
      ),
    );
  }
}
