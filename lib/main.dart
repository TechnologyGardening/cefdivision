import 'package:cefdivision/stopwatch/loginscreen.dart';
import 'package:flutter/material.dart';
import 'stopwatch/stopwatch_exp.dart';

void main() {
  runApp(const MyCustomStop());
}

class MyCustomStop extends StatelessWidget {
  const MyCustomStop({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginFromScreen(),
    );
  }
}
