import 'package:adom/shared/shared_values.dart';
import 'package:adom/ui/screen/commons/objects/device.dart';
import 'package:adom/ui/screen/commons/theme_helper.dart';
import 'package:adom/ui/screen/devices/add_device.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DeviceDetails extends StatefulWidget {
  const DeviceDetails({super.key});

  @override
  State<DeviceDetails> createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  Device? selectedDevice;

  @override
  void initState() {
    super.initState();
    if (SharedValues.device != null && SharedValues.user!.devices.isNotEmpty) {
      List<Device> devices = SharedValues.user!.devices.where((element) => element.id == SharedValues.device!.id).toList();
      if (devices.isNotEmpty) {
        selectedDevice = devices.first;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDDDDD),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_outlined),
                      color: Colors.black,
                      constraints: const BoxConstraints(maxHeight: 50, maxWidth: 50),
                      onPressed: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                      },
                      enableFeedback: true,
                      hoverColor: Colors.red,
                    ),
                  ),
                  Text('device info'.toUpperCase(), style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Poppins-Italic')),
                  const SizedBox(width: 32.0),
                ],
              ),
            ),
            listOfDevices(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Text(
                    'Add device'.toUpperCase(),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () async {
                    await PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const AddDevice(),
                      withNavBar: true,
                    );
                    setState(() {});
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: double.infinity,
                child: ElevatedButton(
                  style: selectedDevice != null
                      ? ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(const Size(50, 50)),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.deepPurpleAccent,
                          ),
                        )
                      : ThemeHelper().buttonStyle(),
                  child: Text(
                    'Save'.toUpperCase(),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () {
                    if (selectedDevice != null) {
                      SharedValues.device = selectedDevice;
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  listOfDevices() {
    return SharedValues.user != null && SharedValues.user!.devices.isNotEmpty
        ? ListView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: SharedValues.user!.devices.map((e) {
              return e.d_label.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: ListTile(
                        onTap: () {
                          selectedDevice = e;
                          setState(() {});
                        },
                        tileColor: selectedDevice != null && selectedDevice!.id == e.id ? Colors.deepPurpleAccent : Colors.white,
                        title: Text(
                          e.d_label,
                          style: TextStyle(color: selectedDevice != null && selectedDevice!.id == e.id ? Colors.white : Colors.black),
                        ),
                        subtitle: Text(
                          e.pi_address,
                          style: TextStyle(color: selectedDevice != null && selectedDevice!.id == e.id ? Colors.white : Colors.black),
                        ),
                      ),
                    )
                  : Container();
            }).toList(),
          )
        : Container();
  }
}
