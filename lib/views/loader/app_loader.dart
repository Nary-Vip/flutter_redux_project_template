import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class AppLoader extends StatefulWidget {
  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            width: 700,
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              clipBehavior: Clip.antiAlias,
              child: RiveAnimation.asset(
                "assets/animation/basket_ball.riv",
                placeHolder: Text("Loading"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Nary Books",
            style: GoogleFonts.akayaKanadaka(
                textStyle:
                    TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
