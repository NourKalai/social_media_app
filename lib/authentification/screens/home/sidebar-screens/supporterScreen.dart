import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/appBarSimple.dart';

class SupporterScreen extends StatefulWidget {
  const SupporterScreen({super.key});

  @override
  State<SupporterScreen> createState() => _SupporterScreenState();
}

class _SupporterScreenState extends State<SupporterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(
        title: 'Friends',
      ),
    );
    ;
  }
}
