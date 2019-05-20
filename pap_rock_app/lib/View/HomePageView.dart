import 'package:flutter/material.dart';
import 'package:pap_rock_app/Model/Player.dart';
import 'package:pap_rock_app/ViewModel/HomePageViewModel.dart';

class HomePageView extends HomePageState {
  Player player;
  HomePageView(this.player);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: Text("hello ${player.playerName}"),
      ),
    );
  }
}
