import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../constant/colors.dart';

class CustomLikedNotifcation extends StatelessWidget {
  const CustomLikedNotifcation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Stack(children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/rihen.png"),
              ),
            ),
            Positioned(
              bottom: 10,
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/emna.png"),
              ),
            ),
          ]),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                maxLines: 2,
                text: TextSpan(
                    text: "Emna",
                    style: Theme.of(context).textTheme.titleLarge,
                    // style: Theme.of(context)
                    //     .textTheme
                    //     .headline3!
                    //     .copyWith(color: mainText),
                    children: [
                      TextSpan(
                        text: " and",
                        style: Theme.of(context).textTheme.titleLarge,
                        //   style: Theme.of(context)
                        // .textTheme
                        // .bodyText1!
                        // .copyWith(color: SecondaryText),
                      ),
                      TextSpan(
                        text: " Nada",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Liked your video. 6am",
                // style: Theme.of(context)
                //     .textTheme
                //     .subtitle1!
                //     .copyWith(color: SecondaryText)
              )
            ],
          ),
        ),
        Image.asset(
          "assets/images/Cover.png",
          height: 64,
          width: 64,
        ),
      ],
    );
  }
}
