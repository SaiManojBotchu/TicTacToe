import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class Player {
  static const String none = '';
  static const String X = 'X';
  static const String O = 'O';
  Color cardColorP1 = Colors.green;
  Color cardColorP2 = kBackgroundColor;
  List<List<String>> matrix = List.generate(3, (i) => List.filled(3, ''));

  bool winner = false;
  bool draw = false;
  bool player1 = true;
  int count = 0;
  late String p1, p2;
  var side = '';

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
    return row == n || col == n || diag == n || rdiag == n;
  }

  void updateToEmptyMatrix() {
    matrix = List.generate(3, (i) => List.filled(3, Player.none));
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

  void getPlayerSides(String side) {
    if (side == X) {
      p1 = X;
      p2 = O;
    } else {
      p1 = O;
      p2 = X;
    }
  }

  String getWinnerText() {
    return p1 == side ? 'Player 1 Win' : 'Player 2 Win';
  }

  void resetData() {
    matrix = List.generate(3, (i) => List.filled(3, Player.none));
    cardColorP1 = Colors.green;
    cardColorP2 = kBackgroundColor;
    winner = false;
    draw = false;
    player1 = true;
    count = 0;
  }
}
