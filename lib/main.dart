import 'package:flutter/material.dart';
import 'package:untitled6/ui/RegisterFormPage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      home: RegisterFormPage(),
    );
  }
}
