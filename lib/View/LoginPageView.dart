import 'package:flutter/material.dart';
import 'package:pap_rock_app/Model/Player.dart';
import 'package:pap_rock_app/View/PlayersNameTextField.dart';
import 'package:pap_rock_app/ViewModel/LoginPageViewModel.dart';

///First page visible for user to enter player data
class LoginPageView extends LoginPageState {
  final TextEditingController _txtFieldCtrlr = TextEditingController(text: "");

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _txtFieldCtrlr.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _txtFieldCtrlr.addListener(() {
      isUserNameFormValidated(_txtFieldCtrlr.text);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromRGBO(147, 165, 207, 1),
          const Color.fromRGBO(228, 239, 233, 1),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: Text(
                  "PapRock",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                padding: const EdgeInsets.only(bottom: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Please enter your name",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              PlayersNameTextField(_txtFieldCtrlr),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Select your sex:",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Radio(
                      value: PlayerSex.Male,
                      onChanged: (sexValue) {
                        changePlayerSex(sexValue);
                      },
                      groupValue: user.playerSex,
                    ),
                    Text("Male"),
                    Radio(
                      value: PlayerSex.Female,
                      onChanged: (sexValue) {
                        changePlayerSex(sexValue);
                      },
                      groupValue: user.playerSex,
                    ),
                    Text("Female")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: Colors.blueAccent,
                        child: Text("Select randomly"),
                        onPressed: () {
                          createNewRandomPlayer(this._txtFieldCtrlr);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    MaterialButton(
                      color: Colors.green,
                      child: Text("Done"),
                      onPressed: isTextFormCorrect ? moveToHomeScreen : null,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
