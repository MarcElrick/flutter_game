import 'package:flutter/material.dart';
import 'package:flutter_game/views/titleScreen.dart';

void main() => runApp(FlutterGame());

class FlutterGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TitleScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
