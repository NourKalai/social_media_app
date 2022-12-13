import 'package:diginas_app/constant/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
          size: 26,
        ),
        suffixIcon: Icon(
          Icons.mic,
          color: Colors.blue.shade400,
          size: 26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: "Search your topic",
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        isDense: true,
      ),
    );
  }
}
