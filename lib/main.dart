import 'package:app/constants.dart';
import 'package:flutter/material.dart';

import 'package:app/page/login.dart';

void main() {
  runApp(const BunkieApp());
}

class BunkieApp extends StatelessWidget {
  const BunkieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bunkie',
      home: LoginPage()
    );
  }
}
