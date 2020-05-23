import 'package:flutter/material.dart';
import 'package:flutter_game/boxgame.dart';

class Player {
  final BoxGame game;

  int verticalSpeed;
  int horizontalSpeed;

  Rect playerRect;
  Paint playerPaint;
  bool goingUp = false;
  bool goingRight = false;
  bool goingLeft = false;

  Player(this.game, double x, double y) {
    playerRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    playerPaint = Paint();
    playerPaint.color = Color(0xff006600);
    verticalSpeed = 10;
    horizontalSpeed = 10;
  }
  void render(Canvas c) {
    c.drawRect(playerRect, playerPaint);
  }

  void update(double t) {
    if (goingUp) {
      if (playerRect.top >= 0) {
        playerRect = playerRect.translate(
            0, game.tileSize * -(verticalSpeed + game.score) * t);
      } else {
        goingUp = false;
        game.score++;
      }
    } else {
      if (playerRect.bottom <= game.screenSize.height) {
        playerRect = playerRect.translate(
            0, game.tileSize * (verticalSpeed + game.score) * t);
      } else {
        goingUp = true;
        game.score++;
      }
    }

    if (goingRight) {
      if (playerRect.right <= game.screenSize.width) {
        playerRect = playerRect.translate(game.tileSize * 12 * t, 0);
      } else {
        stopHorizontal();
      }
    }

    if (goingLeft) {
      if (playerRect.left >= 0) {
        playerRect = playerRect.translate(game.tileSize * -12 * t, 0);
      } else {
        stopHorizontal();
      }
    }
  }

  void goRight() {
    goingRight = true;
  }

  void goLeft() {
    goingLeft = true;
  }

  void stopHorizontal() {
    goingRight = false;
    goingLeft = false;
  }
}
