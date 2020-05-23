import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/barrier.dart';
import 'package:flutter_game/player.dart';

class BoxGame extends Game with HasWidgetsOverlay {
  Size screenSize;
  double tileSize;
  Player p;
  Barrier top;
  Barrier bottom;
  int score = 0;

  BoxGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    p = Player(this, screenSize.width / 2 - tileSize / 2, tileSize);
    top = Barrier(this, screenSize.width / 2 - tileSize, 0);
    bottom = Barrier(
        this, screenSize.width / 2 - tileSize, screenSize.height - tileSize);
  }

  void render(Canvas canvas) {
    Rect boxRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint boxPaint = Paint();
    boxPaint.color = Color(0xffffffff);
    canvas.drawRect(boxRect, boxPaint);
    /* TextPainter text = TextPainter(
        text: TextSpan(
            text: score.toString(),
            style: TextStyle(fontSize: 100, color: Colors.black)),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: screenSize.width / 2);*/

    top.render(canvas);
    bottom.render(canvas);
    p.render(canvas);

    //text.paint(canvas, Offset(0, 0));
  }

  void update(double t) {
    top.update(t);
    bottom.update(t);
    p.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    p.stopHorizontal();
    if (d.globalPosition.dx > screenSize.width / 2) {
      p.goRight();
    } else {
      p.goLeft();
    }
  }

  void checkCollisions() {
    //  if(){

    //  }
  }
}
