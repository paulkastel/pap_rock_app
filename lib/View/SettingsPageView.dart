import 'package:flutter/material.dart';
import 'package:pap_rock_app/ViewModel/SettingsPageViewModel.dart';

class SettingsPageView extends SettingsPageState {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Music'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Photos'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.gamepad),
          title: Text('Video'),
          onTap: () => null,
        ),
        Center(child: Text("settings"))
      ],
    );
  }
}
