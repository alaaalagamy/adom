import 'package:adom/ui/screen/Skins/skins_shoes.dart';
import 'package:adom/ui/screen/devices/devices_main.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../commons/widget_keys.dart';

class SkinsWidget extends StatefulWidget {
  const SkinsWidget({Key? key}) : super(key: key);
  @override
  State<SkinsWidget> createState() => _SkinsWidgetState();
}

class _SkinsWidgetState extends State<SkinsWidget> {
  _SkinsWidgetState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Stack(children: [
              //align to top center using Container();
              Container(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: const Image(key: Key(WidgetKey.KEY_SPLASH_SPLASH_IMAGE), image: AssetImage('assets/images/logo_white.png')),
                  )),

              //Alignment at Center
              Container(
                alignment: Alignment.center,
                child: IntrinsicHeight(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color(0xFFEEEEEE),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox.fromSize(
                                    size: const Size(56, 56), // button width and height
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.white, // button color
                                        child: InkWell(
                                          splashColor: Colors.green, // splash color
                                          onTap: () {
                                            PersistentNavBarNavigator.pushNewScreen(
                                              context,
                                              screen: const MainDevicesScreen(
                                                categoryId: 3,
                                              ),
                                              withNavBar: true,
                                            );
                                          },
                                          child: const ImageIcon(
                                            AssetImage('assets/images/sweatshirt.png'),
                                            color: Colors.black,
                                          ), // icon
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text('SWEATSHIRT')
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox.fromSize(
                                    size: const Size(56, 56), // button width and height
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.white, // button color
                                        child: InkWell(
                                          splashColor: Colors.green, // splash color
                                          onTap: () {
                                            PersistentNavBarNavigator.pushNewScreen(
                                              context,
                                              screen: const MainDevicesScreen(
                                                categoryId: 2,
                                              ),
                                              withNavBar: true,
                                            );
                                          },
                                          child: const ImageIcon(
                                            AssetImage('assets/images/shoes.png'),
                                            color: Colors.black,
                                          ), // icon
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text('SHOES')
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox.fromSize(
                                    size: const Size(56, 56), // button width and height
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.white, // button color
                                        child: InkWell(
                                          splashColor: Colors.green, // splash color
                                          onTap: () {
                                            PersistentNavBarNavigator.pushNewScreen(
                                              context,
                                              screen: const MainDevicesScreen(
                                                categoryId: 1,
                                              ),
                                              withNavBar: true,
                                            );
                                          }, // button pressed
                                          child: const ImageIcon(
                                            AssetImage('assets/images/handbag.png'),
                                            color: Colors.black,
                                          ), // icon
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text('HANDBAGS')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // //alignment at veritically center, and at left horizontally
              // Align(
              //     alignment: Alignment.centerLeft,
              //     child:Container(
              //       height:100,
              //       width:100,
              //       color: Colors.orangeAccent,
              //       child: Text("Box IV"),
              //     )
              // ),
              //
              // //alignment at veritically center, and at right horizontally
              // Align(
              //     alignment: Alignment.centerRight,
              //     child:Container(
              //       height:100,
              //       width:100,
              //       color: Colors.greenAccent,
              //       child: Text("Box V"),
              //     )
              // ),
              //
              // //manual position with left, top, right, bottom
              // Positioned(
              //     left:0,
              //     top:0,
              //     //you can use "right" and "bottom" too
              //     child:Container(
              //       height:100,
              //       width:100,
              //       color: Colors.purple,
              //       child: Text("Box VI"),
              //     )
              // ),
            ])));
  }
}
