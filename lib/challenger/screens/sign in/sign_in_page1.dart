import 'package:diginas_app/challenger/screens/sign%20in/sign_in_page2.dart';
import 'package:diginas_app/challenger/screens/signup/register_with_phone.dart';
import 'package:diginas_app/challenger/screens/signup/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SignInPage1 extends StatelessWidget {
  const SignInPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 30, right: 60, left: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/signin.png',
                        width: 250,
                      ),
                      const SizedBox(height: 35),
                      Text(
                        AppLocalizations.of(context)!.welcome,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            color: Color.fromRGBO(46, 98, 212, 1),
                            fontSize: 45),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 224, 219, 219)),
                        height: 50,
                        width: double.infinity,
                        child: SignInButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          Buttons.Facebook,
                          text: AppLocalizations.of(context)!.signinwith +
                              " facebook",
                          onPressed: () {},
                          padding: const EdgeInsets.only(right: 16, left: 0),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: SignInButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          Buttons.Google,
                          text: "${AppLocalizations.of(context)!.signinwith} google",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterWithPhoneNumber()),
                            );
                          },
                          padding: const EdgeInsets.only(right: 20, left: 2),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'Poppins-Regular'),
                      ),
                      const SizedBox(height: 20),
                      button(
                          context,
                          "${AppLocalizations.of(context)!.signinwith} ${AppLocalizations.of(context)!.password}",
                          const Color.fromRGBO(46, 98, 212, 1),
                          Colors.white),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.withoutaccount,
                            style:
                                const TextStyle(fontFamily: 'Poppins', fontSize: 12),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()),
                              );
                            },
                            child: AutoSizeText(
                              AppLocalizations.of(context)!.createaccount,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 23, 40, 83),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )),
        ));
  }

  Container button(
      BuildContext context, String text, Color background, Color colorText) {
    return Container(
      width: 300,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: background,
            foregroundColor: Colors.white,
            shadowColor: const Color.fromARGB(255, 14, 12, 12),
            elevation: 5,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInPage2()),
            );
          },
          child: Text(
            text,
            style: TextStyle(
                color: colorText, fontSize: 17, fontFamily: 'Poppins-Regular'),
          )),
    );
  }
}
