import 'package:diginas_app/authentification/widgets/pagetitleBar.dart';
import 'package:diginas_app/authentification/widgets/rounded.icon.dart';
import 'package:diginas_app/config.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../widgets/rounded.input.field.dart';
import '../../widgets/under.part.dart';
import '../../widgets/upside.dart';
import '../forgotpassword/forgotPassword.dart';
import '../signup/registerwithphone.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  bool isHiddenPassword = true;

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isMailCorrect = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: 'assets/images/login.png',
                ),
                PageTitleBar(
                    title: AppLocalizations.of(context)!.logintoyouraccount),
                Padding(
                  padding: const EdgeInsets.only(top: 320),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15),
                        IconButton(context),
                        const SizedBox(height: 15),
                        Text(
                          AppLocalizations.of(context)!.oruseyouraccount,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Form(
                          key: _loginFormKey,
                          child: Column(
                            children: [
                              RoundedInputField(
                                obscure: false,
                                controller: mailController,
                                suffixIcon: Icon(
                                  Icons.close,
                                  color:
                                      isMailCorrect ? Colors.green : Colors.red,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    isMailCorrect =
                                        EmailValidator.validate(value);
                                  });
                                },
                         
                                hintText: AppLocalizations.of(context)!.email,
                                OnSaved: (value) =>
                                    setState(() => email = value),
                                icon: Icons.email,
                                coloricon:
                                    isMailCorrect ? Colors.green : Colors.red,
                                textinputtype: TextInputType.emailAddress,
                              ),
                              RoundedInputField(
                                obscure: isHiddenPassword,
                                controller: passwordController,
                                textinputtype: TextInputType.text,
                                suffixIcon: GestureDetector(
                                    onTap: () => setState(() =>
                                        isHiddenPassword = !isHiddenPassword),
                                    child: isHiddenPassword
                                        ? const Icon(Icons.remove_red_eye_sharp,
                                            size: 25, color: Colors.grey)
                                        : const Icon(Icons.remove_red_eye,
                                            size: 25, color: kPrimaryColor)),
                                hintText: "Mot de passe",
                                icon: Icons.lock,
                              ),
                              switchListTile(),
                              SizedBox(
                                width: 20,
                              ),
                              button(
                                  context,
                                  AppLocalizations.of(context)!.signin,
                                  kBlue,
                                  Colors.white),
                              const SizedBox(height: 30, width: 30),
                              UnderPart(
                                title: AppLocalizations.of(context)!
                                    .withoutaccount,
                                navigatorText:
                                    AppLocalizations.of(context)!.createaccount,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterWithPhoneNumber()));
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPassword()),
                                    );
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!
                                            .forgotpassword +
                                        "?",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 8, 18, 41),
                                        fontSize: 16),
                                  ))

                              // RoundedInputField(
                              //     obscureText: isHiddenPassword,
                              //     controller: passwordController,
                              //     textinputtype: TextInputType.text,
                              //     suffixIcon: GestureDetector(
                              //         onTap: () => setState(() =>
                              //             isHiddenPassword =
                              //                 !isHiddenPassword),
                              //         child: isHiddenPassword
                              //             ? Icon(Icons.remove_red_eye,
                              //                 size: 25, color: Colors.black38)
                              //             : Icon(Icons.remove_red_eye,
                              //                 size: 25,
                              //                 color: kPrimaryColor)),
                              //     validator: (input) {
                              //       if (input!.isEmpty) {
                              //         return 'Entrer votre mot de passe ';
                              //       } else
                              //         return null;
                              //     },
                              //     hintText: "Mot de passe"),
                              // TextFormWdiget(
                              //   textinputtype: TextInputType.text,
                              //   obscure: false,
                              //   hint: AppLocalizations.of(context)!.email,
                              //   icon: Icons.mail,
                              //   controller: mailController,
                              //   validator: (input) {
                              //     if (input!.isEmpty) {
                              //       return AppLocalizations.of(context)!
                              //           .entermail;
                              //     } else {
                              //       return EmailValidator.validate(input)
                              //           ? null
                              //           : AppLocalizations.of(context)!
                              //               .entervalidmail;
                              //     }
                              //   },
                              //   OnSaved: (value) =>
                              //       setState(() => email = value),
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Container button(
      BuildContext context, String text, Color background, Color colorText) {
    return Container(
      width: 320,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: background,
            onPrimary: Colors.white,
            shadowColor: Color.fromARGB(255, 14, 12, 12),
            elevation: 5,
          ),
          onPressed: () {
            final isValid = _loginFormKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              _loginFormKey.currentState!.save();

              final message = 'Successful login! ';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const SignInPage2()),
          //   );
          // },
          child: Text(
            text,
            style: TextStyle(
                color: colorText, fontSize: 17, fontFamily: 'Poppins-Regular'),
          )),
    );
  }

  switchListTile() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 40),
      child: SwitchListTile(
        dense: true,
        title: Text(
          AppLocalizations.of(context)!.rememberme,
          style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
        ),
        value: true,
        activeColor: kPrimaryColor,
        onChanged: (val) {},
      ),
    );
  }

  IconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        RoundedIcon(imageUrl: "assets/images/facebook.png"),
        SizedBox(width: 20),
        RoundedIcon(imageUrl: "assets/images/google.jpg"),
        SizedBox(width: 20),
        RoundedIcon(imageUrl: "assets/images/insta.png"),
      ],
    );
  }
}
