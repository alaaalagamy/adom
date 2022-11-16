import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:adom/ui/screen/commons/header_widget.dart';
import 'package:adom/ui/screen/commons/theme_helper.dart';

import 'commons/widget_keys.dart';
import 'main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xffDDDDDD),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Image(
                            key: Key(WidgetKey.KEY_SPLASH_SPLASH_IMAGE),
                            image: AssetImage('assets/images/logo_small.png')
                        ),
                      ),


                      const SizedBox(height: 20.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller: _emailController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'User Name', 'Enter your user name'),
                                ),
                              ),
                              const SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Enter your password'),
                                ),
                              ),

                              const SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: _emailController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'FIRST Name', 'Enter your user name'),
                                ),
                              ),
                              const SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: _emailController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'LAST Name', 'Enter your user name'),
                                ),
                              ),
                              const SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: _emailController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'COUNTRY', 'Enter your user name'),
                                ),
                              ),
                              const SizedBox(height: 15.0),


                              Container(
                                child: TextField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'DATE OF BIRTH', 'Enter your password'),
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Container(
                                decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      'REGISTER'.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  // onPressed: () {},
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const MainScreen()));

                                    //After successful login we will redirect to profile page. Let's create profile page now
                                  },
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
