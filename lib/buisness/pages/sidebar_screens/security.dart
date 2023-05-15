import 'package:flutter/material.dart';

import '../../../challenger/screens/home/widgets/appbar_simple.dart';
class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}
class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSimple(
        title: 'Security',
      ),
    );
  
  }
}
