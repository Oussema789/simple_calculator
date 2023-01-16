import 'package:calculator/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 4,
        navigateAfterSeconds: HomeScreen(),
        title: new Text('Do some Math',
          style:  GoogleFonts.bungee(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w900,

          ),
        ),
        image:  Image.asset('images/calculator.png'),
        backgroundColor: Colors.grey,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,

    );
  }
}
