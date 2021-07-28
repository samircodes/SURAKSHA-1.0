import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:suraksha/Screens/first_page.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: FirstPage(),
        image: Image(
          image: AssetImage("images/pic.png"),
          height: 400,
          width: 400,
        ),
        title: Text(
          'Suraksha',
          style: TextStyle(
              fontSize: 40.0, color: Colors.lightBlue[200], fontFamily: 'Pacifico', fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.white,
        loaderColor: Colors.lightBlue[200],
        photoSize: 70.0,
      ),
    );
  }
}
