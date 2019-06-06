import 'package:flutter/material.dart';

class PlayersNameTextField extends StatefulWidget {
  final TextEditingController _txtCtrlr;
  PlayersNameTextField(this._txtCtrlr);

  @override
  _PlayersNameTextFieldState createState() =>
      _PlayersNameTextFieldState(this._txtCtrlr);
}

class _PlayersNameTextFieldState extends State<PlayersNameTextField> {
  _PlayersNameTextFieldState(TextEditingController txtCtrlr) {
    txtFieldCtrlr = txtCtrlr;
  }
  TextEditingController txtFieldCtrlr;
  final formNameKey = GlobalKey<FormState>();

  void changeTextFieldValue(String nameValue) {
    setState(() {
      txtFieldCtrlr.text = nameValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
      child: Form(
        key: formNameKey,
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
          controller: txtFieldCtrlr,
          decoration: InputDecoration(
            hintText: "Player name",
            contentPadding: EdgeInsets.all(15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onFieldSubmitted: (String nameValue) {
            if (formNameKey.currentState.validate()) {
              formNameKey.currentState.save();
              changeTextFieldValue(txtFieldCtrlr.text);
            }
          },
          onSaved: (String nameValue) {
            if (formNameKey.currentState.validate()) {
              formNameKey.currentState.save();
              changeTextFieldValue(txtFieldCtrlr.text);
            }
          },
        ),
      ),
    );
  }
}
