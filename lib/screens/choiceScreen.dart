import 'package:animation/screens/anotherScreen.dart';
import 'package:animation/screens/gameScreen.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  static var myFontWhite =
      GoogleFonts.pressStart2P(textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              "PICK WETIN YOU WAN PLAY\nTIME NO DEY ABEG",
              style: myFontWhite,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: AvatarGlow(
                endRadius: 100,
                duration: Duration(seconds: 2),
                glowColor: Colors.grey[600],
                repeat: true,
                repeatPauseDuration: Duration(seconds: 1),
                startDelay: Duration(seconds: 1),
                shape: BoxShape.rectangle,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return PlayerScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 200.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      border: Border.all(
                        style: BorderStyle.none,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15.0),
                        Icon(Icons.gamepad, color: Colors.white, size: 40.0),
                        SizedBox(width: 15.0),
                        Text(
                          "1Player",
                          style: myFontWhite.copyWith(fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: AvatarGlow(
                endRadius: 100,
                duration: Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 1),
                startDelay: Duration(seconds: 2),
                shape: BoxShape.rectangle,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return GameScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 200.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      border: Border.all(
                        style: BorderStyle.none,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 15.0),
                        Icon(Icons.people, color: Colors.white, size: 40.0),
                        SizedBox(width: 15.0),
                        Text("2Players", style: myFontWhite.copyWith(fontSize: 15.0))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
