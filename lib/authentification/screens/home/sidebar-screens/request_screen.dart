// ignore: file_names
import 'package:flutter/material.dart';

// ignore_for_file: import_of_legacy_library_into_null_safe

import '../widgets/appbar_simple.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSimple(
        title: 'Requests',
      ),
    );
  
  }
}
