import 'package:diginas_app/authentification/screens/splashScreen.dart';
import 'package:diginas_app/authentification/viewmodels/AuthViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'authentification/screens/OnBoard/onboardscreen.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        title: 'action app',
        theme: ThemeData(
            fontFamily: 'Poppins',
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              bodyLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              bodyMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              displayMedium: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                color: Colors.white,
                elevation: 0,
                iconTheme:
                    IconThemeData(color: Color.fromARGB(255, 10, 9, 9)))),
        supportedLocales: L10n.all,
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const //SplashScreen()
            SplashScreen());
  }
}
