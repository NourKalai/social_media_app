import 'package:diginas_app/authentification/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

import '../../constant/config.dart';

class RoundedInputField extends StatefulWidget {
  Widget? suffixIcon;
  final String? hintText;
  final IconData icon;
  bool obscure = false;

  TextEditingController? controller;
  final String? Function(String?)? validator;
  TextInputType textinputtype;
  final OnSaved;
  final onChanged;
  final Color coloricon;
  RoundedInputField({
    Key? key,
    this.suffixIcon,
    this.hintText,
    required this.obscure,
    required this.controller,
    required this.icon,
    this.validator,
    this.coloricon = kPrimaryColor,
    this.OnSaved,
    this.onChanged,
    required this.textinputtype,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.black54),
            suffixIcon: widget.suffixIcon,
            icon: Icon(
              widget.icon,
              color: kPrimaryColor,
            ),
            hintText: widget.hintText,
            hintStyle:
                const TextStyle(fontFamily: 'OpenSans', color: Colors.black54),
            contentPadding: const EdgeInsets.fromLTRB(30, 20, 10, 20),
            border: InputBorder.none),
        controller: widget.controller,
        validator: widget.validator,
        onSaved: widget.OnSaved,
        obscureText: widget.obscure,
      ),
    );
  }
}

// class RoundedInputField extends StatelessWidget {
//   bool isHiddenPassword;

//   Widget? suffixIcon;
//   final String? hintText;
//   final IconData icon;
//   bool obscureText;
//   TextEditingController? controller;
//   final String? Function(String?)? validator;
//   TextInputType textinputtype;
//   final OnSaved;
//   RoundedInputField({
//     Key? key,
//     this.isHiddenPassword = true,
//     this.hintText,
//     required this.controller,
//     required this.icon,
//     this.validator,
//     this.OnSaved,
//     required this.obscureText,
//     required this.textinputtype,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFieldContainer(
//       child: TextFormField(
//         cursorColor: kPrimaryColor,
//         decoration: InputDecoration(
//             icon: Icon(
//               icon,
//               color: kPrimaryColor,
//             ),
//             hintText: hintText,
//             hintStyle: const TextStyle(fontFamily: 'OpenSans'),
//             contentPadding: EdgeInsets.fromLTRB(30, 20, 10, 20),
//             border: InputBorder.none),
//         controller: controller,
//         validator: validator,
//         onSaved: OnSaved,
//         obscureText: isHiddenPassword,
      
//       ),
//     );
//   }
// }
