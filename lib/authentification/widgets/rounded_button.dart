import 'dart:ui';

import 'package:diginas_app/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {Key? key, this.press, this.textColor = Colors.white, required this.text})
      : super(key: key);
  final String text;

  Future<void> Function()? press;
  final Color? textColor;

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kPrimaryLightColor,
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 17),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: Color(0xfff1bb274),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              letterSpacing: 2,
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans')),
    );
  }

 
}

class UserModel {
  final String? id;
  final String? email;
  final String? name;
  final PictureModel? pictureModel;
  const UserModel({this.id, this.email, this.name, this.pictureModel});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'],
      id: json['id'] as String?,
      name: json['name'],
      pictureModel: PictureModel.fromJson(json['picture']['data']));

// {
//     "email" = "dsmr.apps@gmail.com",
//     "id" = 3003332493073668,
//     "name" = "Darwin Morocho",
//     "picture" = {
//         "data" = {
//             "height" = 50,
//             "is_silhouette" = 0,
//             "url" = "https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3003332493073668",
//             "width" = 50,
//         },
//     }
// }
}

class PictureModel {
  final String? url;
  final int? width;
  final int? height;
  const PictureModel({this.url, this.height, this.width});
  factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(
      url: json['url'], width: json['width'], height: json['height']);
}
