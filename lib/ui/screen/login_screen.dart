import 'package:adom/shared/shared_values.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'commons/api_client.dart';
import 'commons/theme_helper.dart';
import 'commons/widget_keys.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorMessage = "";
  final Key _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool pressed = false;
  final ApiClient _clien = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  final _send_data_login = Send_Data_Login();
  late var _UserLoginResponse = UserLoginResponse();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'admin2@sdc.com');
    _passwordController = TextEditingController(text: '123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDDDDD),
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
                        child: Image(key: Key(WidgetKey.KEY_SPLASH_SPLASH_IMAGE), image: AssetImage('assets/images/logo_small.png')),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: TextField(
                                  controller: _emailController,
                                  decoration: ThemeHelper().textInputDecoration('Email', 'Enter your email'),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                width: double.infinity,
                                child: ElevatedButton(
                                    style: ThemeHelper().buttonStyle(),
                                    child: Text(
                                      'Sign In'.toUpperCase(),
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                    // onPressed: () {},
                                    onPressed: () async {
                                      print(_emailController.text);
                                      print(_passwordController.text);
                                      // print(isChecked);

                                      _send_data_login.email = _emailController.text;
                                      _send_data_login.password = _passwordController.text;
                                      // _UserLoginResponse = await loginUser();
                                      _UserLoginResponse = await loginUser();

                                      print(_UserLoginResponse.user?.token);

                                      if (_UserLoginResponse.user?.token != null) {
                                        // Amr change here, I will save the token as a global variable to access it from different places
                                        SharedValues.user = _UserLoginResponse.user;
                                        SharedValues.userEmail = _send_data_login.email;
                                        SharedValues.userPass = _send_data_login.password;

                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Error : $errorMessage",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: const Color(0xff707070),
                                            textColor: Colors.white,
                                            fontSize: 18.0);
                                        //x = _UserLoginResponse.Message.toString();
                                      }
                                    }),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: GestureDetector(
                                  onTap: () {},
                                  // onTap: () {
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             ForgotPasswordPage()),
                                  //   );
                                  // },
                                  child: Text(
                                    "Forgot password?".toUpperCase(),
                                    style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Poppins-Italic'),
                                  ),
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

  Future<UserLoginResponse> loginUser() async {
    return await _clien.loginUser(_send_data_login).then((value) => _UserLoginResponse = value).catchError((e) {
      int errorCode = 0;
      errorMessage = "";
      switch (e.runtimeType) {
        case DioError:
          final res = (e as DioError).response;
          if (res != null) {
            errorCode = res.statusCode!;
            errorMessage = res.statusMessage!;
          } else {
            print("error ${e.message}");
          }
          print(errorCode);
          print(errorMessage);
          return _UserLoginResponse;
        default:
      }
    });
  }
}
