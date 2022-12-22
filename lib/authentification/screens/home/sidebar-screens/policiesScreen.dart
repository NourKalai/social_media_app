import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/appBarSimple.dart';

class PoliciesScreen extends StatefulWidget {
  const PoliciesScreen({super.key});

  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}

class _PoliciesScreenState extends State<PoliciesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSimple(
        title: 'Policies',
      ),
    );
    ;
  }
}
