import 'package:flutter/material.dart';
import './home/home-page.dart';

void main() => runApp(RuralApp());

const PrimaryColor = const Color(0xFF163172);

class RuralApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RuralApp',
      theme: ThemeData(
        primaryColor: PrimaryColor,
      ),
      home: new HomePage(),
    );
  }
}
