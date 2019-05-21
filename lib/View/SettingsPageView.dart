import 'package:flutter/material.dart';
import 'package:pap_rock_app/ViewModel/SettingsPageViewModel.dart';

class SettingsPageView extends SettingsPageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings"),
      ),
      body: Center(
        child: Text("settings"),
      ),
    );
  }
}
