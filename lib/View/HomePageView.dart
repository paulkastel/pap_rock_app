import 'package:flutter/material.dart';
import 'package:pap_rock_app/Model/Player.dart';
import 'package:pap_rock_app/ViewModel/HomePageViewModel.dart';
import 'package:pap_rock_app/ViewModel/SettingsPageViewModel.dart';

class HomePageView extends HomePageState {
  Player player;
  HomePageView(this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings_applications),
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SettingsPage();
                  });
            },
          )
        ],
      ),
      body: Center(
        child: Text("hello ${player.playerName}"),
      ),
    );
  }
}
