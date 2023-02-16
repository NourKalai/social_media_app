import 'package:flutter/material.dart';
class SearchTextField extends StatefulWidget {
  final String? title;
  const  SearchTextField({super.key,this.title});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
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
        labelText: widget.title,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        isDense: true,
      ),
    );
  }
}
