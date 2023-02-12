import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:diginas_app/authentification/screens/home/widgets/app_bar.dart';
import 'package:diginas_app/authentification/screens/home/widgets/body.dart';
import 'package:diginas_app/authentification/screens/home/widgets/sideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          drawer: const SideBar(),
          key: _scaffoldKey,
          body: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  AppbarWidget(
                    scaffoldKey: _scaffoldKey,
                    // ignore: prefer_interpolation_to_compose_strings
                    title: AppLocalizations.of(context)!.hello +
                        '\n' +
                        AppLocalizations.of(context)!.welcome +
                        " Saad !",
                  ),
                  const Body()
                ],
              ))),
    );
  }
}
