import 'package:adom/shared/shared_values.dart';
import 'package:adom/ui/screen/Skins/skins_color.dart';
import 'package:adom/ui/screen/Skins/skins_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../commons/widget_keys.dart';

class SkinsShoes extends StatefulWidget {
  const SkinsShoes({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<SkinsShoes> createState() => _SkinsShoesState();
}

class _SkinsShoesState extends State<SkinsShoes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Stack(children: [
              //align to top center using Container();
              Container(
                  alignment: Alignment.topCenter,
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                    child: Image(key: Key(WidgetKey.KEY_SPLASH_SPLASH_IMAGE), image: AssetImage('assets/images/logo_white.png')),
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
                                              screen: const SkinsImage(
                                                type: 'video',
                                              ),
                                              withNavBar: true,
                                            );
                                          },
                                          child: const ImageIcon(
                                            AssetImage('assets/images/video.png'),
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text('Video')
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
                                              screen: const SkinsImage(
                                                type: 'image',
                                              ),
                                              withNavBar: true, // OPTIONAL VALUE. True by default.
                                              // pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                            );
                                          },
                                          child: const ImageIcon(
                                            AssetImage('assets/images/images.png'),
                                            color: Colors.black,
                                          ), // icon
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text('photo')
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
                                              screen: const SkinsColor(),
                                              withNavBar: true, // OPTIONAL VALUE. True by default.
                                              // pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                            );
                                          },
                                          child: const ImageIcon(
                                            AssetImage('assets/images/color.png'),
                                            color: Colors.black,
                                          ), // icon
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text('color')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //manual position with left, top, right, bottom
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                //you can use "right" and "bottom" too
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text(
                            'presets'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Poppins-Italic'),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/back1.png',
                                ),
                                Text(
                                  'study time'.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Card(
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/back2.png',
                              ),
                              Text(
                                'social media'.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        )),
                        Expanded(
                            child: Card(
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/back3.png',
                              ),
                              Text(
                                'summer beach'.toUpperCase(),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ],
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
