import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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

  bool onesTurn = true;
  var myResult = TextStyle(color: Colors.white, fontSize: 30);
  int firstScore = 0;
  int secondScore = 0;
  int filledBoxes = 0;

  static var myFont =
      GoogleFonts.pressStart2P(textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
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
                        Text("O's score", style: myFontWhite),
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
                        Text("X's Score", style: myFontWhite),
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
                    _gameStart(index);
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

  _gameStart(int index) {
    setState(() {
      if (onesTurn && displayGame[index] == '') {
        displayGame[index] = 'O';
        filledBoxes += 1;
      } else if (!onesTurn && displayGame[index] == '') {
        displayGame[index] = 'X';
        filledBoxes += 1;
      }
      onesTurn = !onesTurn;
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
