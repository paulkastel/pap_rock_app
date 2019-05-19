import 'package:flutter/material.dart';
import 'package:pap_rock_app/Model/Player.dart';
import 'package:pap_rock_app/ViewModel/LoginPageViewModel.dart';

///First page visible for user to enter player data
class LoginPageView extends LoginPageState {
  TextEditingController _txtFieldCtrlr;
  FocusNode _textFieldFcsNode;

  bool _isTextFormCorrect;

  ///Method that set _isTextFormCorrect based on valid logic
  void _isUserNameFormValidated() {
    setState(() {
      if (_txtFieldCtrlr.text.length < 5)
        _isTextFormCorrect = false;
      else
        _isTextFormCorrect = true;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _txtFieldCtrlr.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _isTextFormCorrect = false;
    _txtFieldCtrlr = new TextEditingController();
    _textFieldFcsNode = new FocusNode();
    _txtFieldCtrlr.addListener(_isUserNameFormValidated);
    _textFieldFcsNode.addListener(_isUserNameFormValidated);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PapRocker"),
      ),
      body: Center(
        //TODO: nice background with gradient
        child: Form(
          key: formNameKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                  maxLength: 30,
                  keyboardType: TextInputType.text,
                  validator: (nameValue) {
                    if (nameValue.length < 5) {
                      return "Name is too short";
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
                      groupValue: userSex,
                    ),
                    Text("Male"),
                    Radio(
                      value: PlayerSex.Female,
                      onChanged: (sexValue) {
                        changePlayerSex(sexValue);
                      },
                      groupValue: userSex,
                    ),
                    Text("Female")
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    child: Text("Select randomly"),
                    onPressed: () {
                      print("generate random hero");
                    },
                  ),
                  MaterialButton(
                    child: Text("Done"),
                    onPressed: _isTextFormCorrect ? createNewPlayer : null,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
