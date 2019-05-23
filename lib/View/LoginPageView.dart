import 'package:flutter/material.dart';
import 'package:pap_rock_app/Model/Player.dart';
import 'package:pap_rock_app/ViewModel/LoginPageViewModel.dart';

///First page visible for user to enter player data
class LoginPageView extends LoginPageState {
  TextEditingController _txtFieldCtrlr;
  FocusNode _textFieldFcsNode;

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _txtFieldCtrlr.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _txtFieldCtrlr = new TextEditingController(text: "");
    _textFieldFcsNode = new FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    _txtFieldCtrlr.addListener(isUserNameFormValidated(_txtFieldCtrlr.text));
    _textFieldFcsNode.addListener(isUserNameFormValidated(_txtFieldCtrlr.text));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromRGBO(147, 165, 207, 1),
          const Color.fromRGBO(228, 239, 233, 1),
        ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        child: Center(
          child: Form(
            key: formNameKey,
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
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: TextFormField(
                    autovalidate: true,
                    autocorrect: false,
                    maxLength: 20,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    validator: (nameValue) {
                      if (nameValue.length < 5) {
                        return "Name is too short!";
                      }
                      if (!RegExp(r'^[a-zA-Z]+$').hasMatch(nameValue)) {
                        return "Name shouldn't contain any special characters!";
                      }
                    },
                    controller: _txtFieldCtrlr,
                    focusNode: _textFieldFcsNode,
                    decoration: InputDecoration(
                      hintText: "Player name",
                      contentPadding: EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onFieldSubmitted: (String nameValue) {
                      changePlayerName(_txtFieldCtrlr.text);
                    },
                    onSaved: (String nameValue) {
                      changePlayerName(_txtFieldCtrlr.text);
                    },
                  ),
                ),
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
                        onPressed: isTextFormCorrect ? createNewPlayer : null,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
