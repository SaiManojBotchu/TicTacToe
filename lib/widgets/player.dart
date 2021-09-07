import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class Player {
  static const String none = '';
  static const String X = 'X';
  static const String O = 'O';
  static String pressed = '';

  Color cardColorP1 = kActiveCardColor;
  Color cardColorP2 = kContainerCardColor;
  List<List<String>> matrix = List.generate(3, (i) => List.filled(3, ''));
  List<List<Color>> cardColors = List.generate(3, (i) => List.filled(3, kContainerCardColor));

  bool winner = false;
  bool draw = false;
  bool player1 = true;
  int count = 0;
  late String p1, p2;
  var side = '';
  List<int> li = [];

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

  void updateToEmptyMatrix() {
    matrix = List.generate(3, (i) => List.filled(3, Player.none));
    cardColors = List.generate(3, (i) => List.filled(3, kContainerCardColor));
  }

  void updateCardColors() {
    cardColors[li[0]][li[1]] = kWinnerCardColor;
    cardColors[li[2]][li[3]] = kWinnerCardColor;
    cardColors[li[4]][li[5]] = kWinnerCardColor;
  }

  void changeProfileCardColor() {
    var z = cardColorP1;
    cardColorP1 = cardColorP2;
    cardColorP2 = z;
  }

  void updateMatrix(int x, int y) {
    side = player1 ? p1 : p2;
    if (matrix[x][y] == '') {
      matrix[x][y] = side;
      player1 = !player1;
      count++;
    }
  }

  void getPlayerSides() {
    if (pressed == O) {
      p1 = O;
      p2 = X;
    } else {
      p1 = X;
      p2 = O;
    }
  }

  String getWinnerText() {
    return p1 == side ? 'Player 1 Win' : 'Player 2 Win';
  }

  void resetData() {
    updateToEmptyMatrix();
    cardColorP1 = kActiveCardColor;
    cardColorP2 = kContainerCardColor;
    winner = false;
    draw = false;
    player1 = true;
    count = 0;
    pressed = '';
  }
}
