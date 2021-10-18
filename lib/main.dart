import 'package:calculator_flutter_academy/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Calculadora - Flutter Academy Nebulova'),
    );
  }
}
