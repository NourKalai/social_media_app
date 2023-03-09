import 'package:diginas_app/authentification/api/google_signin_api.dart';
import 'package:diginas_app/authentification/screens/home/base_screen.dart';
import 'package:diginas_app/authentification/screens/sign%20in/home.dart';
import 'package:diginas_app/authentification/widgets/page_titleBar.dart';
import 'package:diginas_app/authentification/widgets/rounded_icon.dart';
import 'package:diginas_app/constant/config.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/login-response.model.dart';
import '../../widgets/rounded_input_field.dart';
import '../../widgets/under_part.dart';
import '../../widgets/upside.dart';
import '../forgotpassword/forgot_password.dart';
import '../signup/register_with_phone.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isApiCallProcess = false;
  // AccessToken? _accessToken;
  // UserModel? _currentUser;
  late LoginRequestModel loginRequestModel;

  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel();
  }

  @override
  void dispose() {
    mailController.dispose();
    super.dispose();
  }

  bool isHiddenPassword = true;

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _loginFormKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isMailCorrect = false;
  @override
  Widget build(BuildContext context) {
    // UserModel? user = _currentUser;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
            width: size.width,
            height: size.height,
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
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 15),
                          IconButton(context),
                          const SizedBox(height: 15),
                          Text(
                            AppLocalizations.of(context)!.oruseyouraccount,
                            style: const TextStyle(
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
                                    color: isMailCorrect
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isMailCorrect =
                                          EmailValidator.validate(value);
                                    });
                                  },
                                  hintText: AppLocalizations.of(context)!.email,
                                  onSaved: (value) =>
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
                                          ? const Icon(
                                              Icons.remove_red_eye_sharp,
                                              size: 25,
                                              color: Colors.grey)
                                          : const Icon(Icons.remove_red_eye,
                                              size: 25, color: kPrimaryColor)),
                                  hintText:
                                      AppLocalizations.of(context)!.password,
                                  icon: Icons.lock,
                                ),
                                switchListTile(),
                                const SizedBox(
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
                                  navigatorText: AppLocalizations.of(context)!
                                      .createaccount,
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
                                      "${AppLocalizations.of(context)!
                                              .forgotpassword}?",
                                      style: const TextStyle(
                                          color: Color.fromARGB(255, 8, 18, 41),
                                          fontSize: 16),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
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
            backgroundColor: background,
            foregroundColor: Colors.white,
            shadowColor: const Color.fromARGB(255, 14, 12, 12),
            elevation: 5,
          ),
          onPressed: () {
            final isValid = _loginFormKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              _loginFormKey.currentState!.save();
              setState(() {
                isApiCallProcess = false;
              });
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const BaseScreen()));
              const message = 'Successful login! ';
              const snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
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
          style: const TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
        ),
        value: true,
        activeColor: kPrimaryColor,
        onChanged: (val) {},
      ),
    );
  }

  Row IconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedIcon(
          imageUrl: "assets/images/facebook.png",
          ontap: press,
        ),
        const SizedBox(width: 20),
        RoundedIcon(
          imageUrl: "assets/images/google.jpg",
          ontap: signInGoogle,
        ),
        const SizedBox(width: 20),
        const RoundedIcon(imageUrl: "assets/images/insta.png"),
      ],
    );
  }

  bool validateAndSave() {
    final form = _loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future signInGoogle() async {
    try {
      final user = await GoogleSignInApi.login();
      if (user == null) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Sign in Failed')));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => HomePage(
                    url: user.photoUrl!,
                    name: user.displayName!,
                    email: user.email))));
      }
    } catch (error) {
      return error;
    }
  }

  Future<void> press() async {
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        // print(userData);
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => HomePage(
                    url: userData['picture']['data']['url'],
                    name: userData['name'],
                    email: userData['email']))));
      }
    } catch (error) {
      print(error);
    }
  }
}
