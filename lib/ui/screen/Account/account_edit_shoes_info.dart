import 'package:flutter/material.dart';
import '../commons/theme_helper.dart';

class AccountEditShoesInfo extends StatefulWidget {
  const AccountEditShoesInfo({Key? key}) : super(key: key);

  @override
  State<AccountEditShoesInfo> createState() => _AccountEditShoesInfoState();
}

class _AccountEditShoesInfoState extends State<AccountEditShoesInfo> {
  String errorMessage = "";
  final Key _formKey = GlobalKey<FormState>();
  late TextEditingController _oldPassController;
  late TextEditingController _newPassController;
  bool pressed = false;
  bool passenable = true; //boolean value to track password view enable disable.

  @override
  void initState() {
    super.initState();
    _oldPassController = TextEditingController();
    _newPassController = TextEditingController();
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
                  Text('my password'.toUpperCase(), style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Poppins-Italic')),
                  const SizedBox(width: 32.0),
                ],
              ),
            ),
            Card(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Card(
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              width: double.infinity,
                              child: Text(
                                'edit password'.toUpperCase(),
                                style: const TextStyle(fontSize: 20, fontFamily: 'Poppins-Italic', fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: TextField(
                                controller: _oldPassController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: ThemeHelper().textInputDecoration('current password', 'Enter current password'),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: TextField(
                                controller: _newPassController,
                                enableSuggestions: false,
                                autocorrect: false,
                                obscureText: passenable, //if passenable == true, show **, else show password character
                                decoration: InputDecoration(
                                    hintText: "Enter new Password",
                                    labelText: "new Password",
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                    focusedBorder:
                                        OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.grey)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          //add Icon button at end of TextField
                                          setState(() {
                                            //refresh UI
                                            if (passenable) {
                                              //if passenable == true, make it false
                                              passenable = false;
                                            } else {
                                              passenable = true; //if passenable == false, make it true
                                            }
                                          });
                                        },
                                        icon: Icon(passenable == true ? Icons.visibility : Icons.visibility_off))),
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
