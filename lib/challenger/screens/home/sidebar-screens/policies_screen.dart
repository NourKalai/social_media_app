import 'package:flutter/material.dart';
import '../widgets/appbar_simple.dart';
class PoliciesScreen extends StatefulWidget {
  const PoliciesScreen({super.key});

  @override
  State<PoliciesScreen> createState() => _PoliciesScreenState();
}
class _PoliciesScreenState extends State<PoliciesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSimple(
        title: 'Policies',
      ),
    );
  
  }
}
