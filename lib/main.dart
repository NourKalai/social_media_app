import 'package:diginas_app/authentification/screens/home/base_screen.dart';
import 'package:diginas_app/authentification/screens/splash_screen1.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'buisness/widget_tree.dart';
import 'constant/provider/theme_data.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Settings.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            title: 'action app',
            themeMode: themeProvider.themeMode,
            // theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            supportedLocales: L10n.all,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color.fromARGB(255, 10, 238, 124),
                  iconTheme: IconThemeData(
                    color: Colors.white, //<-- SEE HERE
                  ),
                ),
                visualDensity: VisualDensity.adaptivePlatformDensity),
            localizationsDelegates: const [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: BaseScreen()
            // SignUp()

            );
      });
}
