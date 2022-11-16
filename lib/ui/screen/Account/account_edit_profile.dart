import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../commons/api_client.dart';

import '../commons/theme_helper.dart';
import '../commons/widget_keys.dart';
import '../main_screen.dart';
import 'account_edit_login_info.dart';

class AccountEditProfile extends StatefulWidget {
  const AccountEditProfile({Key? key}) : super(key: key);

  @override
  State<AccountEditProfile> createState() => _AccountEditProfileState();
}

class _AccountEditProfileState extends State<AccountEditProfile> {
  String errorMessage = "";
  final Key _myformKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  bool pressed = false;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDDDDD),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                      color: Colors.black,
                      constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
                      onPressed: () {
                        print("Icon Button clicked");
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                      },
                      enableFeedback: true,
                      hoverColor: Colors.red,
                    ),
                  ),
                  Text('my profile'.toUpperCase(), style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Poppins-Italic')),
                  const SizedBox(width: 32.0),
                ],
              ),
            ),
            Card(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Card(
                    child: Form(
                        key: _myformKey,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              width: double.infinity,
                              child: Text(
                                'edit My Profile'.toUpperCase(),
                                style: const TextStyle(fontSize: 20, fontFamily: 'Poppins-Italic', fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: TextField(
                                controller: _firstNameController,
                                decoration: ThemeHelper().textInputDecoration('First Name', 'Enter your First name'),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: TextField(
                                controller: _lastNameController,
                                decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your Last name'),
                              ),
                            ),
                          ],
                        ))),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Text(
                    'Save'.toUpperCase(),
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
