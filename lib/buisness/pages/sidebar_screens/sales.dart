import 'package:flutter/material.dart';

import '../../../authentification/screens/home/widgets/appbar_simple.dart';
class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}
class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSimple(
        title: 'Sales',
      ),
    );
  
  }
}
