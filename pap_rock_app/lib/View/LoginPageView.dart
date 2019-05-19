import 'package:flutter/material.dart';
import 'package:pap_rock_app/Model/Player.dart';
import 'package:pap_rock_app/ViewModel/LoginPageViewModel.dart';

class LoginPageView extends LoginPageState {
  final formNameKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PapRocker"),
      ),
      body: Center(
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
                  decoration: InputDecoration(
                    hintText: "Player name",
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onSaved: (String nameValue) {
                    print("nameValue saved");
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
                    //TODO: disable button on failed valid
                    child: Text("Done"),
                    onPressed: () {
                      if (formNameKey.currentState.validate()) {
                        formNameKey.currentState.save();
                        print("player created");
                      }
                    },
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
