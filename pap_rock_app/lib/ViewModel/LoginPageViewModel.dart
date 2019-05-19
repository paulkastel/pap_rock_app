import 'package:flutter/material.dart';
import 'package:pap_rock_app/Model/Player.dart';
import 'package:pap_rock_app/View/LoginPageView.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageView createState() => LoginPageView();
}

abstract class LoginPageState extends State<LoginPage> {
  PlayerSex userSex;
  String userName;
  @override
  void initState() {
    userSex = PlayerSex.Male;
    userName = "";
    super.initState();
  }

  void changePlayerSex(PlayerSex sexValue) {
    setState(() {
      userSex = sexValue;
    });
  }
}
