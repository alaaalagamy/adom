import 'package:adom/shared/shared_values.dart';
import 'package:adom/ui/screen/Skins/skins_shoes.dart';
import 'package:adom/ui/screen/commons/objects/device.dart';
import 'package:adom/ui/screen/commons/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainDevicesScreen extends StatefulWidget {
  const MainDevicesScreen({super.key, required this.categoryId});

  final int categoryId;

  @override
  State<MainDevicesScreen> createState() => _MainDevicesScreenState();
}

class _MainDevicesScreenState extends State<MainDevicesScreen> {
  // 2 -> Shoes
  // 3 -> Shirt
  // 1 -> Bag
  @override
  Widget build(BuildContext context) {
    List<Device> devices = SharedValues.user!.devices.where((element) => element.d_category == widget.categoryId).toList();
    String path = '';
    if (devices.isNotEmpty) {
      path = getImagePath(devices[0].d_category);
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Stack(
          children: [
            //align to top center using Container();
            Container(
                alignment: Alignment.topCenter,
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Image(key: Key(WidgetKey.KEY_SPLASH_SPLASH_IMAGE), image: AssetImage('assets/images/logo_white.png')),
                )),

            devices.isNotEmpty
                ? Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 100),
                    child: GridView.builder(
                      itemCount: devices.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print('clicked ---');
                            SharedValues.device = devices[index];
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const SkinsShoes(),
                              withNavBar: true,
                            );
                          },
                          child: Column(
                            children: [
                              SizedBox.fromSize(
                                size: const Size(56, 56), // button width and height
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: ImageIcon(
                                      AssetImage(path),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                devices[index].d_label,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: Text(
                      'No devices available',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  String getImagePath(num categoryId) {
    switch (categoryId) {
      case 1:
        return 'assets/images/handbag.png';
      case 2:
        return 'assets/images/shoes.png';
      case 3:
        return 'assets/images/sweatshirt.png';
      default:
        return '';
    }
  }
}
