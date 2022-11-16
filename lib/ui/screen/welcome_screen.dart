import 'package:adom/ui/screen/login_screen.dart';
import 'package:adom/ui/screen/main_screen.dart';
import 'package:adom/ui/screen/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    color: const Color(0xFFEEEEEE),
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'WELCOME TO ADOM',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Poppins-Italic',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: Row(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Create an account to personalize\nyour ADOMwear ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Poppins-Italic',
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, right: 20),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                                },
                                child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start, //change here don't //worked
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const <Widget>[
                                              Text(
                                                "SIGN IN",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 10.0),
                                              Text(
                                                'I already have an account',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0),
                                              )
                                            ],
                                          ),
                                          const Spacer(), // I just added one line
                                          const Icon(Icons.navigate_next,
                                              color: Colors.black) // This Icon
                                        ],
                                      ),
                                    )))),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 10, right: 20 , bottom: 10),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_) => const RegisterScreen()));
                                },
                                child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start, //change here don't //worked
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const <Widget>[
                                              Text(
                                                "REGISTER",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 10.0),
                                              Text(
                                                'Join ADOM',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14.0),
                                              )
                                            ],
                                          ),
                                          const Spacer(), // I just added one line
                                          const Icon(Icons.navigate_next,
                                              color: Colors.black) // This Icon
                                        ],
                                      ),
                                    ))))
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
