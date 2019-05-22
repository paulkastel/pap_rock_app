import 'package:flutter/material.dart';
import 'ViewModel/LoginPageViewModel.dart';

/*===============================
Main method - application start
===============================*/
main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'PassionOne'),
    home: LoginPage(),
    title: "PapRocker",
    initialRoute: "/",
  ));
}
