import 'package:diginas_app/authentification/screens/home/models/follow_model.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomRequest extends StatefulWidget {
  final imageUrl;
  final name;
  const CustomRequest({Key? key,  this.imageUrl, this.name}) : super(key: key);

  @override
  State<CustomRequest> createState() => _CustomRequestState();
}

class _CustomRequestState extends State<CustomRequest> {
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
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(widget.imageUrl),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.name,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: follow == false ? 20 : 10),
            child: CustomButton(
              height: 40,
              color: follow == false
                  ? Color.fromARGB(255, 10, 238, 124)
                  : const Color.fromARGB(255, 238, 234, 234),
              textColor: follow == false ? Colors.white : Colors.black,
              onTap: () {
                setState(() {
                  follow = !follow;
                });
              },
              text: follow == false ? "Follow" : "Unfollow",
            ),
          ),
        ],
      ),
    );
  }
}
