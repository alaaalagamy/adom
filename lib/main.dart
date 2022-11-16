import 'package:flutter/material.dart';
import 'package:adom/ui/screen/splash_screen.dart';

void main() {
  runApp(const AdomApp());
}

class AdomApp extends StatelessWidget {
  const AdomApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // delete debug banner
      // home:MainScreen(),
      home: SplashScreen(),

    );
  }
}
