import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  List<String> displayGame = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool playersTurn = true;
  int firstScore = 0;
  int secondScore = 0;
  int filledBoxes = 0;

  static var myFontWhite =
      GoogleFonts.pressStart2P(textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          SizedBox(height: 15),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player", style: myFontWhite),
                        SizedBox(height: 20),
                        Text(firstScore.toString(), style: myFontWhite)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Computer", style: myFontWhite),
                        SizedBox(height: 20),
                        Text(secondScore.toString(), style: myFontWhite)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _startGame(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey[700])),
                    child: Center(
                      child: Text(
                        displayGame[index],
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _compChoice() {
    final random = new Random();
    int empty = random.nextInt(displayGame.length);
    if (displayGame[empty] == '') {
      displayGame[empty] = "O";
    }
  }

  _startGame(int index) {
    setState(() {
      if (playersTurn && displayGame[index] == '') {
        filledBoxes++;
        displayGame[index] = "X";
        _compChoice();
      }
      _checkWinner();
    });
  }

  _checkWinner() {
    if (displayGame[0] == displayGame[1] &&
        displayGame[0] == displayGame[2] &&
        displayGame[0] != '') {
      _showWinDialog(displayGame[0]);
    }

    if (displayGame[3] == displayGame[4] &&
        displayGame[3] == displayGame[5] &&
        displayGame[3] != '') {
      _showWinDialog(displayGame[3]);
    }

    if (displayGame[6] == displayGame[7] &&
        displayGame[6] == displayGame[8] &&
        displayGame[6] != '') {
      _showWinDialog(displayGame[6]);
    }

    if (displayGame[0] == displayGame[3] &&
        displayGame[0] == displayGame[6] &&
        displayGame[0] != '') {
      _showWinDialog(displayGame[0]);
    }

    if (displayGame[1] == displayGame[4] &&
        displayGame[1] == displayGame[7] &&
        displayGame[1] != '') {
      _showWinDialog(displayGame[1]);
    }

    if (displayGame[2] == displayGame[5] &&
        displayGame[2] == displayGame[8] &&
        displayGame[2] != '') {
      _showWinDialog(displayGame[2]);
    }

    if (displayGame[6] == displayGame[4] &&
        displayGame[6] == displayGame[2] &&
        displayGame[6] != '') {
      _showWinDialog(displayGame[6]);
    }

    if (displayGame[0] == displayGame[4] &&
        displayGame[0] == displayGame[8] &&
        displayGame[0] != '') {
      _showWinDialog(displayGame[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(content: Text('ITS A DRAWWW!!!'), actions: [
            FlatButton(
                child: Text('Play Again Boss'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                })
          ]);
        });
  }

  _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(content: Text('THE WINNER IS: ' + winner), actions: [
            FlatButton(
                child: Text('Play Again Boss'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                })
          ]);
        });
    if (winner == 'O') {
      firstScore += 1;
    } else if (winner == 'X') {
      secondScore += 1;
    }
  }

  _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayGame[i] = '';
      }
    });

    filledBoxes = 0;
  }
}
