// import 'package:flutter/material.dart';

// Container button(BuildContext context, String text, Color background,
//     Color colorText, GlobalKey<FormState> loginFormKey) {
//   return Container(
//     width: 320,
//     height: 60,
//     child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           primary: background,
//           onPrimary: Colors.white,
//           shadowColor: Color.fromARGB(255, 14, 12, 12),
//           elevation: 5,
//         ),
//         onPressed: () {
//           final isValid = loginFormKey.currentState!.validate();
//           // FocusScope.of(context).unfocus();

//           if (isValid) {
//             loginFormKey.currentState!.save();

//             final message = 'Successful login! ';
//             final snackBar = SnackBar(
//               content: Text(
//                 message,
//                 style: TextStyle(fontSize: 20),
//               ),
//               backgroundColor: Colors.green,
//             );
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           }
//         },
//         //   Navigator.push(
//         //     context,
//         //     MaterialPageRoute(builder: (context) => const SignInPage2()),
//         //   );
//         // },
//         child: Text(
//           text,
//           style: TextStyle(
//               color: colorText, fontSize: 17, fontFamily: 'Poppins-Regular'),
//         )),
//   );
// }
