import 'package:adom/ui/screen/board_screen.dart';
import 'package:adom/ui/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:adom/ui/screen/login_screen.dart';
import 'package:adom/ui/screen/commons/widget_keys.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) =>  WelcomeScreen()), (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(mainAxisSize: MainAxisSize.max, children: const <Widget>[
          Spacer(),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Align(
                alignment: Alignment.center,
                child: Image(
                    key: Key(WidgetKey.KEY_SPLASH_SPLASH_IMAGE),
                    image: AssetImage('assets/images/logo.png'))),
          ),
          Spacer(),

          Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'The First\nPhygital FASH-TECH BRAND',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,color: Colors.white ,fontFamily: 'Poppins-Italic' ),
            ),
          ),


        ]));
  }
}
