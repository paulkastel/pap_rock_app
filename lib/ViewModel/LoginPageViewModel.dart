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

  void changePlayerName(String nameValue) {
    setState(() {
      userName = nameValue;
    });
  }

  void createNewPlayer() {
    if (formNameKey.currentState.validate()) {
      formNameKey.currentState.save();
      print("new player created: $userSex, $userName");
      Player mainPlayer = new Player(userName, userSex);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePage(mainPlayer)));
    }
  }
}
