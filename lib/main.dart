import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game/boxgame.dart';
import 'package:flutter/gestures.dart';

void main() {
  // TODO: MAKE TAPS NOT MUTUALLY EXCLUSIVE
  BoxGame game = BoxGame();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  //tapper.onTapUp = game.onTapUp;
  runApp(game.widget);

  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);
  flameUtil.addGestureRecognizer(tapper);
}
