import 'package:flutter/material.dart';

import '../../../authentification/screens/home/widgets/appbar_simple.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSimple(
        title: 'Setting',
      ),
    );
  
  }
}
