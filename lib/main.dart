import 'package:app/page/authentication/login.dart';
import 'package:flutter/material.dart';

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
      home: LoginPage(isError: false),
    );
  }
}
