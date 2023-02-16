import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'dart:io';

import '../../widgets/rounded_input_field.dart';
import '../../widgets/title_widget.dart';
import 'choose_user.dart';

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
  bool isDateCorrect = false;
  bool isFirstNameCorrect = false;
  bool isLastNameCorrect = false;
  bool ispasswordCorrect = false;
  final _loginFormKey = GlobalKey<FormState>();
  bool firstValue = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String firstName = '';
  String lastName = '';
  String mail = "";
  String date = "";

  bool islastNameCorrect = false;
  bool isMailCorrect = false;
  TextEditingController dateInput = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  late Size size;
  String imagepath = "assets/images/aa.png";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          body: Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage("assets/images/back.png"),
                  //     fit: BoxFit.cover),
                  ),
              child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                      children: [
                        Center(
                            child: Column(children: [
                          const SizedBox(height: 25),
                          Column(children: [
                            Stack(children: [
                              image != null
                                  ? ClipOval(
                                      child: Image.file(image!,
                                          width: 200,
                                          height: 200,
                                          fit: BoxFit.cover))
                                  : Image.asset(
                                      imagepath,
                                      height: 100,
                                      width: 100,
                                    ),
                              Positioned(
                                  top: 0,
                                  right: 4,
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
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.green,
                                          )),
                                    ),
                                  ))
                            ]),
                          ]),
                          const SizedBox(height: 25),
                          Form(
                            key: _loginFormKey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
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
                                        if (!value!.isEmpty) {
                                          setState(() {
                                            isFirstNameCorrect = true;
                                          });
                                        }
                                      },
                                      hintText: "First Name",
                                      onSaved: (value) =>
                                          setState(() => firstName = value),
                                      icon: Icons.person,
                                      coloricon: isFirstNameCorrect
                                          ? Colors.green
                                          : Colors.red,
                                      textinputtype: TextInputType.text,
                                    ),
                                    title(context, "Enter your last name"),
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
                                          if (!value!.isEmpty) {
                                            setState(() {
                                              islastNameCorrect = true;
                                            });
                                          }
                                        },
                                        hintText: "Last Name",
                                        onSaved: (value) =>
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
                                          color: isMailCorrect
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                        onChanged: (value) {
                                          if (!value!.isEmpty) {
                                            setState(() {
                                              isMailCorrect =
                                                  EmailValidator.validate(
                                                      value);
                                            });
                                          }
                                        },
                                        hintText: "Mail",
                                        onSaved: (value) =>
                                            setState(() => mail = value),
                                        icon: Icons.mail,
                                        coloricon: isMailCorrect
                                            ? Colors.green
                                            : Colors.red,
                                        textinputtype: TextInputType.text),
                                    title(context, "Enter your date of birth"),
                                    RoundedInputField(
                                        obscure: false,
                                        controller: dateInput,
                                        suffixIcon: Icon(
                                          Icons.close,
                                          color: isDateCorrect
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                        onChanged: (value) {
                                          if (!value!.isEmpty) {
                                            setState(() {
                                              isDateCorrect = true;
                                            });
                                          }
                                        },
                                        hintText: "AAAA-MM-JJ",
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                            const ColorScheme.light(
                                                          primary: Color.fromARGB(
                                                              255,
                                                              141,
                                                              206,
                                                              79), // <-- SEE HERE
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                  context: context,
                                                  initialDate: DateTime(2000),
                                                  firstDate: DateTime(1950),
                                                  //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2015));

                                          if (pickedDate != null) {
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            setState(() {
                                              dateInput.text = formattedDate;
                                              isDateCorrect = true;

                                              //set output date to TextField value.
                                            });
                                          } else {
                                            setState(() {
                                              isDateCorrect = false;

                                              //set output date to TextField value.
                                            });
                                          }
                                        },
                                        onSaved: (value) =>
                                            setState(() => date = value),
                                        icon: Icons.calendar_month,
                                        coloricon: isDateCorrect
                                            ? Colors.green
                                            : Colors.red,
                                        textinputtype: TextInputType.text),
                                    title(context, "Enter your password"),
                                    RoundedInputField(
                                        obscure: isHiddenPassword,
                                        controller: passwordController,
                                        suffixIcon: GestureDetector(
                                            onTap: () => setState(() =>
                                                isHiddenPassword =
                                                    !isHiddenPassword),
                                            child: isHiddenPassword
                                                ? const Icon(
                                                    Icons.remove_red_eye,
                                                    size: 25,
                                                    color: Colors.black38)
                                                : const Icon(
                                                    Icons.remove_red_eye,
                                                    size: 25,
                                                    color: Colors.green)),
                                        onChanged: (value) {
                                          if (!value!.isEmpty) {
                                            setState(() {
                                              ispasswordCorrect = true;
                                            });
                                          }
                                        },
                                        hintText: "Password",
                                        onSaved: (value) =>
                                            setState(() => lastName = value),
                                        icon: Icons.lock,
                                        coloricon: ispasswordCorrect
                                            ? Colors.green
                                            : Colors.red,
                                        textinputtype: TextInputType.text),
                                    const SizedBox(height: 25),
                                    Row(children: <Widget>[
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
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
                                          children: const [
                                            Text(
                                              "J'accecpte les",
                                              style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              " Conditions Générales ",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 128, 204, 104),
                                                  fontSize: 13),
                                            ),
                                            Text(
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
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 75, 201, 71),
                                              width: 2),
                                          color: const Color.fromARGB(
                                              255, 94, 207, 90)),
                                      padding: EdgeInsets.zero,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 108, 201, 65)),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    side: const BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 76, 216, 71))))),
                                        child: const Text(
                                          "Finaliser",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 244, 250, 247),
                                              fontSize: 18),
                                        ),
                                        onPressed: () {
                                          (_loginFormKey.currentState!
                                                      .validate() &&
                                                  isChecked == true)
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ChooseAccount()),
                                                )
                                              : null;
                                          // if (_loginFormKey.currentState!
                                          //         .validate() &&
                                          //     isChecked == true) {
                                          //   //check if form data is valid
                                          //   const message =
                                          //       'Successful sign up! ';
                                          //   const snackBar = SnackBar(
                                          //     content: Text(
                                          //       message,
                                          //       style: TextStyle(fontSize: 20),
                                          //     ),
                                          //     backgroundColor: Colors.green,
                                          //   );
                                          //   ScaffoldMessenger.of(context)
                                          //       .showSnackBar(snackBar);
                                          // }
                                        },
                                      ),
                                    ),
                                  ]),
                            ),
                          )
                        ]))
                      ])))),
    );
  }

  // ignore: non_constant_identifier_names
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
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                onPressed: () {
                  pickImage(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera,
                  color: Colors.green,
                ),
                label: const Text("Camera",
                    style: TextStyle(color: Colors.black))),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                onPressed: () {
                  pickImage(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.photo,
                  color: Colors.green,
                ),
                label: const Text(
                  "Galerie",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        )
      ]),
    );
  }
}
