import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../shared/shared_values.dart';
import '../commons/api_client.dart';

import '../commons/theme_helper.dart';
import '../commons/widget_keys.dart';

class SkinsColor extends StatefulWidget {
  const SkinsColor({Key? key}) : super(key: key);

  @override
  State<SkinsColor> createState() => _SkinsColorState();
}

class _SkinsColorState extends State<SkinsColor> {
  Color currentColor = Colors.deepPurpleAccent;
  final ApiClient _client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  // void changeColor(Color color) => setState(() => currentColor = color);
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                      key: Key(WidgetKey.KEY_SPLASH_SPLASH_IMAGE),
                      width: 100,
                      height: 100,
                      image: AssetImage('assets/images/logo_white.png')),
                ),
              ),
              ColorPicker(
                labelTypes: [],
                pickerColor: currentColor,
                paletteType: PaletteType.hueWheel, displayThumbColor: false,
                enableAlpha: false,
                // onColorChanged: (Color value) {},

                onColorChanged: (Color value) {
                  setState(() {
                    currentColor = value;
                  });
                },

                hexInputBar: false,
              ),
              Text(
                'Color'.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Poppins-Italic'),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: currentColor, // This is what you need!
                        ),
                        child: Text(
                          'Upload'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () async {
                          String valueString  = currentColor.toString();
                          String colorString = valueString.split('(0xff')[1].split(')')[0];
                          Map<String, dynamic> map = {
                              "playlist_type": "color",
                              "is_horizontal": SharedValues.device!.d_category == 1 ? false : true,
                              "device_id": SharedValues.device!.id,
                              "playlist_color":{"ci_code":colorString},
                              "playlist_items": [
                              ]
                            };
                            // send request
                            bool res = await _client.uploadCarouselPlayList(data: map);
                            if (res) {
                              fToast.showToast(
                                toastDuration: const Duration(milliseconds: 2000),
                                child: SizedBox.fromSize(
                                  size: const Size(40, 40), // button width and height
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.green, // button color
                                      child: InkWell(
                                        splashColor: Colors.green, // splash color
                                        onTap: () {},
                                        child: const Icon(Icons.check , color: Colors.white,), // icon
                                      ),
                                    ),
                                  ),
                                ),
                                gravity: ToastGravity.TOP_RIGHT,
                              );
                              // if (!mounted) return;
                              // Navigator.pop(context);
                            } else {
                              fToast.showToast(
                                toastDuration: const Duration(milliseconds: 2000),
                                child: SizedBox.fromSize(
                                  size: const Size(40, 40), // button width and height
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.green, // button color
                                      child: InkWell(
                                        splashColor: Colors.green, // splash color
                                        onTap: () {},
                                        child: const Icon(Icons.error , color: Colors.white,), // icon
                                      ),
                                    ),
                                  ),
                                ),
                                gravity: ToastGravity.TOP_RIGHT,
                              );
                            }

                        },                    ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        side: const BorderSide(
                                            width: 3,
                                            color: Colors.deepPurpleAccent)))
                        ),
                        child: Text(
                          'Restore'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        onPressed: () {setState(() {currentColor = Colors.deepPurpleAccent;});},
                      ),
                    ),
                  ),
                ],
              )
            ]
            ),
          ),
        )
    );
  }


  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
