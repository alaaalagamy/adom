import 'package:adom/ui/screen/Account/account_edit_profile.dart';
import 'package:adom/ui/screen/devices/device_details.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../shared/shared_values.dart';
import 'account_edit_login_info.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  _AccountWidgetState();

  @override
  Widget build(BuildContext context) {
    print('=====build');
    return Scaffold(
      backgroundColor: const Color(0xffDDDDDD),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                margin: const EdgeInsets.fromLTRB(5, 30, 5, 0),
                child: Text('my account'.toUpperCase(), style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Poppins-Italic')),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                            child: Text(
                              'My Profile',
                              style: TextStyle(fontSize: 20, fontFamily: 'Poppins-Italic', fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Title".toUpperCase(),
                                  style: const TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: "assets/fonts/Poppins-Italic.ttf"),
                                ),
                                Text(
                                  SharedValues.user?.gender_str ?? ''.toUpperCase(),
                                  style: const TextStyle(color: Colors.black, fontSize: 14.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "first name".toUpperCase(),
                                  style: const TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: "assets/fonts/Poppins-Italic.ttf"),
                                ),
                                Text(
                                  SharedValues.user?.firstName ?? ''.toUpperCase(),
                                  style: const TextStyle(color: Colors.black, fontSize: 14.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "last name".toUpperCase(),
                                  style: const TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: "assets/fonts/Poppins-Italic.ttf"),
                                ),
                                Text(
                                  SharedValues.user?.lastName ?? ''.toUpperCase(),
                                  style: const TextStyle(color: Colors.black, fontSize: 14.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const AccountEditProfile(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      // pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent.withOpacity(0.1),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.transparent,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'edit'.toUpperCase(),
                        style: const TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Colors.black),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        // <-- Icon
                        Icons.mode_edit_outline_outlined,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                            child: Text(
                              'login info'.toUpperCase(),
                              style: TextStyle(fontSize: 20, fontFamily: 'Poppins-Italic', fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "email".toUpperCase(),
                                  style: const TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: "assets/fonts/Poppins-Italic.ttf"),
                                ),
                                Text(
                                  SharedValues.userEmail ?? ''.toUpperCase(),
                                  style: const TextStyle(color: Colors.black, fontSize: 14.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "password".toUpperCase(),
                                  style: const TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: "assets/fonts/Poppins-Italic.ttf"),
                                ),
                                Text(
                                  SharedValues.userPass ?? ''.replaceAll(RegExp('[^A-Za-z0-9]'), '*'),
                                  style: const TextStyle(color: Colors.black, fontSize: 14.0),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: AccountEditLoginInfo(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      // pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent.withOpacity(0.1),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.transparent,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'edit'.toUpperCase(),
                        style: const TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Colors.black),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        // <-- Icon
                        Icons.mode_edit_outline_outlined,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                            child: Text(
                              'Device info'.toUpperCase(),
                              style: const TextStyle(fontSize: 20, fontFamily: 'Poppins-Italic', fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SharedValues.device != null
                          ? Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start, //change here don't //worked
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        SharedValues.device?.d_label ?? '',
                                        style: const TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: "assets/fonts/Poppins-Italic.ttf"),
                                      ),
                                      Text(
                                        SharedValues.device?.pi_address ?? ''.toUpperCase(),
                                        style: const TextStyle(color: Colors.black, fontSize: 14.0),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('Link a new device'),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    await PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const DeviceDetails(),
                      withNavBar: true,
                    );
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent.withOpacity(0.1),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.transparent,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'edit'.toUpperCase(),
                        style: const TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Colors.black),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.mode_edit_outline_outlined,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
