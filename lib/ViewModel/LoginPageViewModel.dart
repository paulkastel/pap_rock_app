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

  @protected
  bool isTextFormCorrect;

  ///Method that set _isTextFormCorrect based on valid logic
  @protected
  void isUserNameFormValidated(String userNameForValidation) {
    setState(() {
      if (userNameForValidation.length < 5 ||
          !RegExp(r'^[a-zA-Z]+$').hasMatch(userNameForValidation))
        isTextFormCorrect = false;
      else
        isTextFormCorrect = true;
    });
  }

  @override
  void initState() {
    isTextFormCorrect = false;
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

  void createNewRandomPlayer(TextEditingController txtCtrlr) {
    txtCtrlr.text = Player.generateRandomPlayerName();
    changePlayerName(txtCtrlr.text);
    changePlayerSex(Player.generateRandomPlayerSex());
    print("generate random hero ${user.playerName}, ${user.playerSex}");
  }

  void createNewPlayer() {
    if (formNameKey.currentState.validate()) {
      formNameKey.currentState.save();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage(user)));
    }
  }
}
