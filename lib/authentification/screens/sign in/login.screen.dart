import 'package:diginas_app/authentification/screens/sign%20in/home.dart';
import 'package:diginas_app/authentification/screens/splashScreen.dart';
import 'package:diginas_app/authentification/widgets/pagetitleBar.dart';
import 'package:diginas_app/authentification/widgets/rounded.icon.dart';
import 'package:diginas_app/config.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/login-response.model.dart';
import '../../services/authentification.service.dart';
import '../../widgets/rounded.input.field.dart';
import '../../widgets/rounded_button.dart';
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
  bool isApiCallProcess = false;
  AccessToken? _accessToken;
  UserModel? _currentUser;
  late LoginRequestModel loginRequestModel;

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
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
    UserModel? user = _currentUser;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
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
              AuthService().login(loginRequestModel).then((value) {
                if (value != null) {
                  setState(() {
                    isApiCallProcess = false;
                  });
                  if (value.token.isNotEmpty) {
                    final snackBar = SnackBar(
                      content: Text(
                        "Login Successful",
                        style: TextStyle(fontSize: 20),
                      ),
                      backgroundColor: Colors.green,
                    );
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SplashScreen()));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              });

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

  Row IconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedIcon(
          imageUrl: "assets/images/facebook.png",
          ontap: press,
        ),
        SizedBox(width: 20),
        RoundedIcon(imageUrl: "assets/images/google.jpg"),
        SizedBox(width: 20),
        RoundedIcon(imageUrl: "assets/images/insta.png"),
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

  Future<void> press() async {
    try {
      final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print('facebook _login_data:-');
        print(userData);
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
    // final LoginResult result = await FacebookAuth.i.login();
    // if (result.status == LoginStatus.success) {
    //   _accessToken = result.accessToken;
    //   final data = await FacebookAuth.i.getUserData();
    //   UserModel model = UserModel.fromJson(data);
    //   _currentUser = model;
    //   setState(() {});
    // }
  }
}
