import 'package:flutter/material.dart';
import 'package:flutter_game/boxgame.dart';

class Barrier {
  final BoxGame game;
  Rect barrierRect;
  Paint barrierPaint = Paint();

  bool goingRight = true;
  bool goingLeft = false;

  int speed;

  Barrier(this.game, double x, double y) {
    barrierRect = Rect.fromLTWH(x, y, game.tileSize * 2, game.tileSize);
    barrierPaint.color = Color(0xff336754);
  }

  void render(Canvas c) {
    c.drawRect(barrierRect, barrierPaint);
  }

  void update(double t) {
    if (goingRight) {
      if (barrierRect.right < game.screenSize.width) {
        barrierRect = barrierRect.translate(game.tileSize * game.score * t, 0);
      } else {
        goingRight = false;
        goingLeft = true;
      }
    }

    if (goingLeft) {
      if (barrierRect.left > 0) {
        barrierRect = barrierRect.translate(game.tileSize * -game.score * t, 0);
      } else {
        goingRight = true;
        goingLeft = false;
      }
    }
  }

  double getTop() {
    return barrierRect.top;
  }

  double getBottom() {
    return barrierRect.bottom;
  }
}
