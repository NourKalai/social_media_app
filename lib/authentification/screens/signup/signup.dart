import 'package:diginas_app/authentification/screens/signup/profile.screen.dart';
import 'package:diginas_app/authentification/widgets/FormWidget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import '../../widgets/rounded.input.field.dart';
import '../../widgets/titleWidget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image:$e');
    }
  }

  bool hasBeenPressed1 = true;
  bool hasBeenPressed2 = false;
  bool isHiddenPassword = true;
  bool isChecked = false;
  bool isFirstNameCorrect = false;
  bool isLastNameCorrect = false;
  bool ispasswordCorrect = false;
  final _loginFormKey = GlobalKey<FormState>();
  bool firstValue = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String firstName = '';
  String lastName = '';
  bool islastNameCorrect = false;
  bool isMailCorrect = false;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  late Size size;
  String imagepath = "assets/images/avatar.jpg";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
                              color: Color.fromARGB(255, 47, 170, 113),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100))),
                          child: Column(children: [
                            Stack(children: [
                              image != null
                                  ? ClipOval(
                                      child: Image.file(image!,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover))
                                  : Image.asset(
                                      imagepath,
                                      height: 200,
                                      width: 200,
                                    ),
                              Positioned(
                                  top: 0,
                                  right: 4,
                                  child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 13,
                                          child: InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: ((builder) =>
                                                      BottomSheet(context)),
                                                );
                                              },
                                              child: Image.asset(
                                                  'assets/images/icon.png')),
                                        ),

                                        // Icon(Icons.add_a_photo,
                                        //     color: Colors.black),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 3,
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              30,
                                            ),
                                          ),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(2, 4),
                                              color: Color.fromARGB(
                                                      255, 250, 246, 246)
                                                  .withOpacity(
                                                0.3,
                                              ),
                                              blurRadius: 3,
                                            ),
                                          ])))
                            ]),
                          ]),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 30,
                                width: 340,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(223, 245, 241, 241),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(223, 245, 241, 241),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Container(
                                        height: 30,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              223, 245, 241, 241),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: FlatButton(
                                          color: hasBeenPressed1
                                              ? Colors.green
                                              : Color.fromARGB(
                                                  255, 231, 229, 229),
                                          child: Text(
                                            "Homme",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: hasBeenPressed1
                                                    ? Colors.white
                                                    : Colors.black38),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          onPressed: () {
                                            setState(() {
                                              hasBeenPressed1 = true;
                                              hasBeenPressed2 = false;
                                              imagepath =
                                                  "assets/images/avatar.jpg";
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(223, 245, 241, 241),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: FlatButton(
                                        color: hasBeenPressed1
                                            ? Colors.white
                                            : Colors.green,
                                        child: Text(
                                          "Femme",
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: hasBeenPressed2
                                                  ? Colors.white
                                                  : Colors.black38),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        onPressed: () {
                                          setState(() {
                                            hasBeenPressed2 = true;
                                            hasBeenPressed1 = false;
                                            imagepath =
                                                "assets/images/Femme.png";
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(height: 25),
                        Form(
                          key: _loginFormKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                title(context, "Enter your first name"),
                                RoundedInputField(
                                  obscure: false,
                                  controller: firstNameController,
                                  suffixIcon: Icon(
                                    Icons.close,
                                    color: isFirstNameCorrect
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  onChanged: (value) {
                                    if (!value!.isEmpty)
                                      setState(() {
                                        isFirstNameCorrect = true;
                                      });
                                  },
                                  hintText: "First Name",
                                  OnSaved: (value) =>
                                      setState(() => firstName = value),
                                  icon: Icons.person,
                                  coloricon: isFirstNameCorrect
                                      ? Colors.green
                                      : Colors.red,
                                  textinputtype: TextInputType.text,
                                ),
                                title(context, "Enter your last Name"),
                                RoundedInputField(
                                    obscure: false,
                                    controller: lastNameController,
                                    suffixIcon: Icon(
                                      Icons.close,
                                      color: islastNameCorrect
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                    onChanged: (value) {
                                      if (!value!.isEmpty)
                                        setState(() {
                                          islastNameCorrect = true;
                                        });
                                    },
                                    hintText: "Last Name",
                                    OnSaved: (value) =>
                                        setState(() => lastName = value),
                                    icon: Icons.person,
                                    coloricon: isFirstNameCorrect
                                        ? Colors.green
                                        : Colors.red,
                                    textinputtype: TextInputType.text),
                                title(context, "Enter your mail"),
                                RoundedInputField(
                                    obscure: false,
                                    controller: mailController,
                                    suffixIcon: Icon(
                                      Icons.close,
                                      color: islastNameCorrect
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                    onChanged: (value) {
                                      if (!value!.isEmpty)
                                        setState(() {
                                          isMailCorrect =
                                              EmailValidator.validate(value);
                                        });
                                    },
                                    hintText: "Mail",
                                    OnSaved: (value) =>
                                        setState(() => lastName = value),
                                    icon: Icons.mail,
                                    coloricon: isFirstNameCorrect
                                        ? Colors.green
                                        : Colors.red,
                                    textinputtype: TextInputType.text),
                                title(context, "Enter your password"),
                                RoundedInputField(
                                    obscure: false,
                                    controller: passwordController,
                                    suffixIcon: GestureDetector(
                                        onTap: () => setState(() =>
                                            isHiddenPassword =
                                                !isHiddenPassword),
                                        child: isHiddenPassword
                                            ? Icon(Icons.remove_red_eye,
                                                size: 25, color: Colors.black38)
                                            : Icon(Icons.remove_red_eye,
                                                size: 25, color: Colors.green)),
                                    onChanged: (value) {
                                      if (!value!.isEmpty)
                                        setState(() {
                                          ispasswordCorrect = true;
                                        });
                                    },
                                    hintText: "Password",
                                    OnSaved: (value) =>
                                        setState(() => lastName = value),
                                    icon: Icons.lock,
                                    coloricon: isFirstNameCorrect
                                        ? Colors.green
                                        : Colors.red,
                                    textinputtype: TextInputType.text),

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
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePage()),
                                      );
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

  Widget BottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: [
        const Text(
          "Choose your profile picture",
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera,
                  color: Colors.green,
                ),
                label: const Text("Camera")),
            FlatButton.icon(
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.photo,
                  color: Colors.green,
                ),
                label: const Text("Gallery"))
          ],
        )
      ]),
    );
  }
}
