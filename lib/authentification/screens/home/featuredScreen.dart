import 'dart:io';

import 'package:diginas_app/authentification/screens/home/widgets/appbar.dart';
import 'package:diginas_app/authentification/screens/home/widgets/sideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({super.key});

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          drawer: SideBar(),
          key: _scaffoldKey,
          body: Column(
            children: [
              AppbarWidget(
                scaffoldKey: _scaffoldKey,
              )
            ],
          )),
    );
  }
}
