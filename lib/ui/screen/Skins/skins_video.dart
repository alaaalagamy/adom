import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../commons/api_client.dart';

import '../commons/theme_helper.dart';
import '../commons/widget_keys.dart';

class SkinsVideo extends StatefulWidget {
  const SkinsVideo({Key? key}) : super(key: key);

  @override
  State<SkinsVideo> createState() => _SkinsVideoState();
}

class _SkinsVideoState extends State<SkinsVideo> {
  List videosList = [
    Image.asset('assets/images/back2.png'),
    Image.asset('assets/images/back2.png'),
    Image.asset('assets/images/back3.png'),
    Image.asset('assets/images/back2.png'),
    Image.asset('assets/images/back1.png'),
    Image.asset('assets/images/back2.png'),
    Image.asset('assets/images/back3.png'),
    Image.asset('assets/images/back1.png'),
  ];

  List imgList = [
    Image.asset('assets/images/back1.png'),
    Image.asset('assets/images/back2.png'),
    Image.asset('assets/images/back3.png'),
    Image.asset('assets/images/back1.png'),
    Image.asset('assets/images/back1.png'),
    Image.asset('assets/images/back2.png'),
    Image.asset('assets/images/back3.png'),
    Image.asset('assets/images/back1.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: const Align(
                alignment: Alignment.topCenter,
                child: Image(key: Key(WidgetKey.KEY_SPLASH_SPLASH_IMAGE), image: AssetImage('assets/images/logo_white.png')),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: [
                  Text(
                    'videos'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Poppins-Italic'),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(
                height: 100,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  // showing list of images
                  for (var item in videosList) Container(child: item),
                ])),
            const SizedBox(height: 80),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: [
                  Text(
                    'images'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Poppins-Italic'),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(
                height: 100,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  // showing list of images
                  for (var item in imgList) Container(child: item),
                ])),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent, // This is what you need!
                        ),
                        child: Text(
                          'Upload'.toUpperCase(),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2), side: const BorderSide(width: 3, color: Colors.deepPurpleAccent)))),
                        child: Text(
                          'Text'.toUpperCase(),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2), side: const BorderSide(width: 3, color: Colors.deepPurpleAccent)))),
                        child: Text(
                          'Carousel'.toUpperCase(),
                          maxLines: 1,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
