import 'dart:math';

import 'package:adom/ui/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'main_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
    );
  }

  Widget _buildFullscreenImageName(String assetName) {
    return Image.asset(
      'assets/images/$assetName',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('logo.png', 100),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          titleWidget: const SizedBox(height: 0),
          bodyWidget: Container(
            margin:const EdgeInsets.only(bottom: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEEEEE)),
              child: Text(
                'discover the collection'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins-Italic',
                    backgroundColor: Color(0xFFEEEEEE),
                    color: Colors.black),
              ),
              onPressed: () {},
            ),
          ),
          image: _buildFullscreenImageName('image1.png'),
          decoration: const PageDecoration(
            fullScreen: true,
            bodyFlex: 0,
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox(height: 0),
          bodyWidget: Container(
            margin:const EdgeInsets.only(bottom: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEEEEE)),
              child: Text(
                'discover the collection'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins-Italic',
                    backgroundColor: Color(0xFFEEEEEE),
                    color: Colors.black),
              ),
              onPressed: () {},
            ),
          ),
          image: _buildFullscreenImageName('image2.png'),
          decoration: const PageDecoration(
            fullScreen: true,
            bodyFlex: 0,
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox(height: 0),
          bodyWidget: Container(
            margin:const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEEEEE)),
              child: Text(
                'discover the collection'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins-Italic',
                    backgroundColor: Color(0xFFEEEEEE),
                    color: Colors.black),
              ),
              onPressed: () {},
            ),
          ),
          image: _buildFullscreenImageName('image3.png'),
          decoration: const PageDecoration(
            fullScreen: true,
            bodyFlex: 0,
          ),
        )
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      isProgress: false,
      //rtl: true, // Display as right-to-left
      // next: Transform.rotate(
      //   angle: 270 * pi/180,
      //   child: Icon(Icons.keyboard_double_arrow_down , color: Colors.black),
      // ),

       next: const Icon(Icons.keyboard_double_arrow_down, color: Colors.white),

      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600 , color:Colors.white )),
      pagesAxis: Axis.vertical,

      controlsMargin: const EdgeInsets.all(16),



    );
  }
}


