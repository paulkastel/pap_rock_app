import 'package:flutter/material.dart';
import 'package:pap_rock_app/Model/Player.dart';
import 'package:pap_rock_app/View/HomePageView.dart';

class HomePage extends StatefulWidget {
  final Player player;
  HomePage(this.player);

  @override
  HomePageView createState() => HomePageView(player);
}

abstract class HomePageState extends State<HomePage> {}
