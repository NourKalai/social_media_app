import 'package:flutter/material.dart';

import '../../../challenger/screens/home/widgets/appbar_simple.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarSimple(
        title: 'Users',
      ),
    );
  }
}
