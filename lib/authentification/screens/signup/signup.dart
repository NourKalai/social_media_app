import 'package:diginas_app/authentification/widgets/FormWidget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../widgets/titleWidget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isHiddenPassword = true;
  bool isChecked = false;

  final _loginFormKey = GlobalKey<FormState>();
  bool firstValue = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        key: scaffoldKey,
        body: SafeArea(
            child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                          child: Column(children: [
                        Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.blue,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 25),
                        Form(
                          key: _loginFormKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                title(context, "Enter your first name"),
                                TextFormWdiget(
                                  textinputtype: TextInputType.text,
                                  obscure: false,
                                  icon: Icons.person,
                                  hint: 'FirstName',
                                  controller: nameController,
                                  validator: (input) {
                                    if (input!.isEmpty) {
                                      return "entrer votre nom";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(height: 25),
                                title(context, "Enter your last name"),
                                TextFormWdiget(
                                    textinputtype: TextInputType.text,
                                    obscure: false,
                                    hint: 'LastName',
                                    icon: Icons.person,
                                    controller: lastNameController,
                                    validator: (input) {
                                      if (input!.isEmpty) {
                                        return "entrer votre prenom";
                                      } else {
                                        return null;
                                      }
                                    }),
                                const SizedBox(height: 25),
                                title(context, "Enter your email"),
                                TextFormWdiget(
                                    textinputtype: TextInputType.text,
                                    obscure: false,
                                    hint: 'Email',
                                    controller: mailController,
                                    icon: Icons.mail,
                                    validator: (input) {
                                      if (input!.isEmpty) {
                                        return 'Entrer votre email';
                                      } else {
                                        return EmailValidator.validate(input)
                                            ? null
                                            : 'Entrer un mail valide';
                                      }
                                    }),
                                const SizedBox(height: 25),
                                title(context, "Enter your phone number"),
                                TextFormWdiget(
                                  obscure: false,
                                  textinputtype: TextInputType.number,
                                  icon: Icons.phone,
                                  hint: 'PhoneNumber',
                                  controller: phoneNumberController,
                                  validator: (input) {
                                    if (input!.isEmpty) {
                                      return 'Entrer un numero de telehone';
                                    } else if (input.length < 8) {
                                      return 'entrer un numero de telephone valide';
                                    } else
                                      return null;
                                  },
                                )
                                // TextFormWidget(
                                //   obscure: false,
                                //   textinputtype: TextInputType.number,
                                //   hint: 'Numero de telephone',
                                //   controller: phoneNumberController,
                                //   validator: (input) {
                                //     if (input!.isEmpty) {
                                //       return 'Entrer un numero de telehone';
                                //     } else if (input.length < 8) {
                                //       return 'entrer un numero de telephone valide';
                                //     } else
                                //       return null;
                                //   },
                                // ),
                                // const SizedBox(height: 25),
                                // TextFormWidget(
                                //     controller: passwordController,
                                //     textinputtype: TextInputType.text,
                                //     obscure: isHiddenPassword,
                                //     suffixIcon: GestureDetector(
                                //         onTap: () => setState(() =>
                                //             isHiddenPassword = !isHiddenPassword),
                                //         child: isHiddenPassword
                                //             ? Icon(Icons.remove_red_eye,
                                //                 size: 25, color: Colors.black38)
                                //             : Icon(Icons.remove_red_eye,
                                //                 size: 25,
                                //                 color: Const.mainGreenColor)),
                                //     validator: (input) {
                                //       if (input!.isEmpty) {
                                //         return 'Entrer votre mot de passe ';
                                //       } else
                                //         return null;
                                //     },
                                //     hint: "Mot de passe"),
                                // const SizedBox(height: 25),
                                // TextFormWidget(
                                //     textinputtype: TextInputType.text,
                                //     obscure: true,
                                //     validator: (input) {
                                //       if (input!.isEmpty) {
                                //         return 'Entrer votre mot de passe ';
                                //       } else if (input == passwordController.text) {
                                //         return null;
                                //       } else {
                                //         'mot de passe incorrect ';
                                //       }
                                //       return null;
                                //     },
                                //     hint: "Confirmer mot de passe"),
                                ,
                                SizedBox(height: 25),
                                Row(children: <Widget>[
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    activeColor: Colors.green,
                                    checkColor: Colors.grey,
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value ?? false;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Expanded(
                                    child: Wrap(
                                      children: [
                                        const Text(
                                          "J'accecpte les",
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          " Conditions Générales ",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 13),
                                        ),
                                        const Text(
                                          " d'utilisation ",
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 13),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                                const SizedBox(height: 40),
                                Container(
                                  width: size.width * 0.9,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: Colors.green, width: 2),
                                      color: Colors.white),
                                  padding: EdgeInsets.zero,
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Finaliser",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 18),
                                    ),
                                    onPressed: () {
                                      isChecked &&
                                              _loginFormKey.currentState!
                                                  .validate()
                                          ? {}
                                          : null;

                                      if (_loginFormKey.currentState!
                                              .validate() &&
                                          isChecked == true) {
                                        //check if form data is valid
                                        final message = 'Successful sign up! ';
                                        final snackBar = SnackBar(
                                          content: Text(
                                            message,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          backgroundColor: Colors.green,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                  ),
                                ),
                              ]),
                        )
                      ]))
                    ]))));
  }
}

Container error(String input) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Text(
      input,
      style: TextStyle(color: Colors.red),
    ),
  );
}
