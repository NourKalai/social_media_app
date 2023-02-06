// ignore_for_file: unnecessary_new

import 'package:animate_do/animate_do.dart';
import 'package:diginas_app/authentification/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_otp/flutter_otp.dart';

import 'package:flutter_verification_code/flutter_verification_code.dart';

class Verificatoin extends StatefulWidget {
  String phoneNumber;
  Verificatoin({Key? key, required this.phoneNumber}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _VerificatoinState createState() => _VerificatoinState();
}

void sendOtp(String phoneNumber) {
  FlutterOtp().sendOtp("52950384");
}

class _VerificatoinState extends State<Verificatoin> {
  // ignore: unused_field
  String _textContent = 'Waiting for messages...';

  // @override
  // void initState() {
  //   super.initState();

  //   _smsReceiver = SmsReceiver(onSmsReceived, onTimeout: onTimeout);
  //   _startListening();
  // }

  void onSmsReceived(String? message) {
    // print(_textContent);

    setState(() {
      _textContent = "1000";
    });
  }

  void onTimeout() {
    setState(() {
      _textContent = 'Timeout!!!';
    });
  }

  void _startListening() async {
    // if (_smsReceiver == null)
    //   return;
    // else
      setState(() {
        _textContent = 'Waiting for messages...';
      });
  }

  // TextEditingController? textEditingController1;

  String _comingSms = 'Unknown';

  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;
  String _otpCode = "";

  String _code = '';

  // ignore: unused_field
  late Timer _timer;
  int _start = 60;
  int _currentIndex = 0;

  void resend() {
    setState(() {
      _isResendAgain = true;
      FlutterOtp().sendOtp("52950384");
    });

    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  verify() {
    if (_otpCode == _code) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    } else {
      setState(() {
        _isLoading = true;
      });
    }

    // const oneSec = Duration(milliseconds: 2000);
    // _timer = new Timer.periodic(oneSec, (timer) {
    //   setState(() {
    //     _isLoading = false;
    //     _isVerified = true;
    //   });
    // });
  }

  @override
  void initState() {
    _otpCode = "1000";

    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex++;
        if (_currentIndex == 3) _currentIndex = 0;
      });
    });

    super.initState();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   textEditingController1 = TextEditingController();
  //   initSmsListener();
  // }

  // @override
  // void dispose() {
  //   // textEditingController1.dispose();
  //   AltSmsAutofill().unregisterListener();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // print("phone:" + widget.phoneNumber);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    child: Stack(children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: AnimatedOpacity(
                          opacity: _currentIndex == 0 ? 1 : 0,
                          duration: const Duration(
                            seconds: 1,
                          ),
                          curve: Curves.linear,
                          child: Image.network(
                            'https://ouch-cdn2.icons8.com/eza3-Rq5rqbcGs4EkHTolm43ZXQPGH_R4GugNLGJzuo/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNjk3/L2YzMDAzMWUzLTcz/MjYtNDg0ZS05MzA3/LTNkYmQ0ZGQ0ODhj/MS5zdmc.png',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: AnimatedOpacity(
                          opacity: _currentIndex == 1 ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear,
                          child: Image.network(
                            'https://ouch-cdn2.icons8.com/pi1hTsTcrgVklEBNOJe2TLKO2LhU6OlMoub6FCRCQ5M/rs:fit:784:666/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMzAv/MzA3NzBlMGUtZTgx/YS00MTZkLWI0ZTYt/NDU1MWEzNjk4MTlh/LnN2Zw.png',
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: AnimatedOpacity(
                          opacity: _currentIndex == 2 ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.linear,
                          child: Image.network(
                            'https://ouch-cdn2.icons8.com/ElwUPINwMmnzk4s2_9O31AWJhH-eRHnP9z8rHUSS5JQ/rs:fit:784:784/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNzkw/Lzg2NDVlNDllLTcx/ZDItNDM1NC04YjM5/LWI0MjZkZWI4M2Zk/MS5zdmc.png',
                          ),
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Verification",
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Please enter the 4 digit code sent to \n ${widget.phoneNumber}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade500,
                        height: 1.5),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // Verification Code Input
                  VerificationCode(
                    length: 4,
                    textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                    underlineColor: Colors.black,
                    keyboardType: TextInputType.number,
                    underlineUnfocusedColor: Colors.black,
                    onCompleted: (value) {
                      setState(() {
                        _code = value;
                      });
                    },
                    onEditing: (value) {},
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't resive the OTP?",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade500),
                      ),
                      TextButton(
                          onPressed: () {
                            if (_isResendAgain) return;
                            resend();
                          },
                          child: Text(
                            _isResendAgain
                                ? "Try again in $_start"
                                : "Resend",
                            style: const TextStyle(color: Colors.blueAccent),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // PinCodeTextField(
                  //   appContext: context,
                  //   pastedTextStyle: TextStyle(
                  //     color: Colors.green.shade600,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   length: 4,
                  //   obscureText: false,
                  //   animationType: AnimationType.fade,
                  //   pinTheme: PinTheme(
                  //       shape: PinCodeFieldShape.box,
                  //       borderRadius: BorderRadius.circular(10),
                  //       fieldHeight: 50,
                  //       fieldWidth: 40,
                  //       inactiveFillColor: Colors.white,
                  //       inactiveColor: Colors.grey,
                  //       selectedColor: Colors.blueGrey,
                  //       selectedFillColor: Colors.white,
                  //       activeFillColor: Colors.white,
                  //       activeColor: Colors.blue),
                  //   cursorColor: Colors.black,
                  //   animationDuration: Duration(milliseconds: 300),
                  //   enableActiveFill: true,
                  //   controller: textEditingController1,
                  //   keyboardType: TextInputType.number,
                  //   boxShadows: [
                  //     BoxShadow(
                  //       offset: Offset(0, 1),
                  //       color: Colors.black12,
                  //       blurRadius: 10,
                  //     )
                  //   ],
                  //   onCompleted: (v) {
                  //     //do something or move to next screen when code complete
                  //   },
                  //   onChanged: (value) {
                  //     print(value);
                  //     setState(() {
                  //       print('$value');
                  //     });
                  //   },
                  // ),
                  FadeInDown(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(milliseconds: 500),
                    child: MaterialButton(
                      elevation: 0,
                      onPressed: _code.length < 4
                          ? () => {}
                          : () {
                              verify();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()),
                              );
                            },
                      color: const Color.fromARGB(255, 67, 120, 199),
                      minWidth: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: _isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                strokeWidth: 3,
                                color: Colors.black,
                              ),
                            )
                          : _isVerified
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : const Text(
                                  "Verify",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                    ),
                  ),
                  // ElevatedButton(
                  //   child: const Text('Listen Again'),
                  //   onPressed: initState,
                  // ),
                  // Text(
                  //   _textContent,
                  //   style: TextStyle(color: Colors.amber),
                  // )
                ],
              )),
        ));
  }
}
