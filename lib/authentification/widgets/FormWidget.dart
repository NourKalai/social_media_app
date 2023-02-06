import 'package:diginas_app/constant/config.dart';
import 'package:flutter/material.dart';

class TextFormWdiget extends StatelessWidget {
  String? hint;

  TextEditingController? controller;
  IconData? icon;
  bool obscure = false;
  TextInputType textinputtype;
  Widget? suffixIcon;
  final String? Function(String?)? validator;
  final OnSaved;

  TextFormWdiget(
      {Key? key,
      required this.textinputtype,
      this.suffixIcon,
      this.hint,
      this.icon,
      required this.obscure,
      this.controller,
      required this.validator,
      this.OnSaved})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textinputtype,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Icon(icon, size: 25, color: const Color.fromRGBO(46, 98, 212, 1)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Color.fromARGB(223, 245, 241, 241)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Color.fromARGB(223, 245, 241, 241)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Color.fromARGB(223, 245, 241, 241)),
        ),
        fillColor: kPrimaryLightColor,
        //  suffixIcon: Icon(icon, size: 25, color: Colors.black38),
        filled: true,
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 15),
        contentPadding: const EdgeInsets.fromLTRB(30, 20, 10, 20),
      ),
      controller:controller,
      validator: validator,
      onSaved: OnSaved,
    );
  }
}
