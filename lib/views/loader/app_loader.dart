import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLoader extends StatefulWidget {
  @override
  _AppLoaderState createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SvgPicture.asset(
          "assets/images/spotify-icon.svg",
        ),
      ),
    );
  }
}
