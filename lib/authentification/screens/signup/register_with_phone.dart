import 'package:animate_do/animate_do.dart';
import 'package:diginas_app/authentification/screens/sign%20in/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../forgotpassword/valid.dart';

class RegisterWithPhoneNumber extends StatefulWidget {
  const RegisterWithPhoneNumber({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterWithPhoneNumberState createState() =>
      _RegisterWithPhoneNumberState();
}

class _RegisterWithPhoneNumberState extends State<RegisterWithPhoneNumber> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/sms.png',
              fit: BoxFit.cover,
              width: 280,
            ),
            const SizedBox(
              height: 50,
            ),
            FadeInDown(
              child: const Text(
                'REGISTER',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color.fromARGB(255, 66, 199, 106)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              child: Text(
                'Enter your phone number to continu, we will send you OTP to verifiy.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black.withOpacity(0.13)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffeeeeee),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {},
                    onInputValidated: (bool value) {
                      // print(value);
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    textFieldController: controller,
                    formatInput: false,
                    maxLength: 9,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    cursorColor: Colors.black,
                    inputDecoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(bottom: 15, left: 0),
                      border: InputBorder.none,
                      hintText: 'Phone Number',
                      hintStyle:
                          TextStyle(color: Colors.grey.shade500, fontSize: 16),
                    ),
                    // onSaved: (value) =>
                    //     setState(() => phoneNumber = value as String)
                  ),
                  Positioned(
                    left: 90,
                    top: 8,
                    bottom: 8,
                    child: Container(
                      height: 40,
                      width: 1,
                      color: Colors.black.withOpacity(0.13),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            MaterialButton(
              minWidth: double.infinity,
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });

                Future.delayed(const Duration(seconds: 2), () {
                  // setState(() {
                  //   _isLoading = false;
                  // });
                  // print("phone:" + phoneNumber);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Verificatoin(
                                phoneNumber: phoneNumber,
                              )));
                });
              },
              color: const Color.fromARGB(255, 83, 223, 130),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Color.fromARGB(255, 57, 170, 47),
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      "Request OTP",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
