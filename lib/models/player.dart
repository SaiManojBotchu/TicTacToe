import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:tic_tac_toe/models/settings.dart';

final assetsAudioPlayer = AssetsAudioPlayer();

class Player {
  static const String none = '';
  static const String X = 'X';
  static const String O = 'O';
  static String pressed = '';

  static Color cardColorP1 = kActiveCardColor;
  static Color cardColorP2 = kContainerCardColor;
  static List<List<String>> matrix = List.generate(3, (i) => List.filled(3, ''));
  static List<List<Color>> cardColors = List.generate(3, (i) => List.filled(3, kContainerCardColor));

  static String p1 = 'X', p2 = 'O';
  static int count = 0;
  static bool player1 = true;

  static bool winner = false;
  static bool finished = false;
  static bool draw = false;
  static String side = '';
  static List<int> li = [];

  bool checkWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;
    final player = matrix[x][y];
    final n = 3;
    for (int i = 0; i < n; i++) {
      if (matrix[x][i] == player) col++;
      if (matrix[i][y] == player) row++;
      if (matrix[i][i] == player) diag++;
      if (matrix[i][n - i - 1] == player) rdiag++;
    }

    if (col == n) {
      li = [x, 0, x, 1, x, 2];
    } else if (row == n) {
      li = [0, y, 1, y, 2, y];
    } else if (diag == n) {
      li = [0, 0, 1, 1, 2, 2];
    } else if (rdiag == n) {
      li = [0, 2, 1, 1, 2, 0];
    }
    return row == n || col == n || diag == n || rdiag == n;
  }

  static void updateToEmptyMatrix() {
    matrix = List.generate(3, (i) => List.filled(3, Player.none));
    cardColors = List.generate(3, (i) => List.filled(3, kContainerCardColor));
  }

  void updateMatrix(int x, int y) {
    side = player1 ? p1 : p2;
    matrix[x][y] = side;
    player1 = !player1;
    count++;
  }

  void updateCardColors() {
    cardColors[li[0]][li[1]] = kWinnerCardColor;
    cardColors[li[2]][li[3]] = kWinnerCardColor;
    cardColors[li[4]][li[5]] = kWinnerCardColor;
  }

  void changeProfileCardColor() {
    cardColorP1 = player1 ? kActiveCardColor : kContainerCardColor;
    cardColorP2 = player1 ? kContainerCardColor : kActiveCardColor;
  }

  void changeWinnerCardColor() {
    if (p1 == side) {
      cardColorP1 = kWinnerCardColor;
    } else if (p2 == side) {
      cardColorP2 = kWinnerCardColor;
    }
  }

  void getPlayerSides() {
    if (pressed == O) {
      p1 = O;
      p2 = X;
    } else if (pressed == X) {
      p1 = X;
      p2 = O;
    }
  }

  String getWinnerText() {
    return p1 == side ? '${Settings.playerNames[0]} Wins' : '${Settings.playerNames[1]} Wins';
  }

  static void resetStaticData() {
    updateToEmptyMatrix();
    cardColorP1 = kActiveCardColor;
    cardColorP2 = kContainerCardColor;
    count = 0;
    winner = false;
    draw = false;
    p1 = X;
    p2 = O;
    side = '';
    li = [];
    finished = false;
  }

  void resetData() {
    resetStaticData();
    pressed = '';
    player1 = true;
  }
}
