import 'package:flutter/material.dart';
import 'package:pap_rock_app/Model/Player.dart';
import 'package:pap_rock_app/View/LoginPageView.dart';
import 'HomePageViewModel.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageView createState() => LoginPageView();
}

abstract class LoginPageState extends State<LoginPage> {
  final formNameKey = GlobalKey<FormState>();

  @protected
  Player user;

  @override
  void initState() {
    user = new Player("", PlayerSex.Male);
    super.initState();
  }

  void changePlayerSex(PlayerSex sexValue) {
    setState(() {
      user.playerSex = sexValue;
    });
  }

  void changePlayerName(String nameValue) {
    setState(() {
      user.playerName = nameValue;
    });
  }

  void createNewPlayer() {
    if (formNameKey.currentState.validate()) {
      formNameKey.currentState.save();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage(user)));
    }
  }
}
