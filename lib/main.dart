import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import './screens/login/index.dart';

void main() {
  runApp(const MaterialApp(
    title: "app",
    home: Login(),
   debugShowCheckedModeBanner: false
  ));
}
