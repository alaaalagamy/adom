import 'package:adom/shared/shared_values.dart';
import 'package:adom/ui/screen/commons/api_client.dart';
import 'package:adom/ui/screen/commons/theme_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddDevice extends StatefulWidget {
  const AddDevice({super.key});

  @override
  State<AddDevice> createState() => _AddDeviceState();
}

class _AddDeviceState extends State<AddDevice> {
  final ApiClient _apiClient = ApiClient(Dio(BaseOptions(contentType: "application/json")));

  String errorMessage = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _deviceNameController;
  late TextEditingController _devicePIAddressController;
  int? deviceCategory = 1;
  @override
  void initState() {
    super.initState();
    _deviceNameController = TextEditingController();
    _devicePIAddressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDDDDD),
      body: Container(
        margin: const EdgeInsets.all(10),
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
                  Text('add device'.toUpperCase(), style: const TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'Poppins-Italic')),
                  const SizedBox(width: 32.0),
                ],
              ),
            ),
            Card(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: TextField(
                            controller: _deviceNameController,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: ThemeHelper().textInputDecoration('device name', 'Enter device name'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: TextField(
                            controller: _devicePIAddressController,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: ThemeHelper().textInputDecoration('device address', 'Enter device address'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: ListTile(
                            contentPadding: const EdgeInsets.only(left: 5),
                            minVerticalPadding: 0,
                            title: const Text('Device category'),
                            subtitle: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: deviceCategory,
                                items: const [
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text('Handbag'),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text('Shoes'),
                                  ),
                                  DropdownMenuItem(
                                    value: 3,
                                    child: Text('Sweatshirt'),
                                  )
                                ],
                                onChanged: (value) {
                                  deviceCategory = value;
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                width: double.infinity,
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Text(
                    'Save'.toUpperCase(),
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Map<String, String> data = {
                        'pi_address': _devicePIAddressController.text,
                        'd_category': deviceCategory.toString(),
                        'd_label': _deviceNameController.text
                      };
                      var res = await _apiClient.addDevice(data: data);
                      if (res) {
                        // update devices
                        SharedValues.user!.devices = await _apiClient.getDevices();
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Device added successfully')));
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error happened, please try again')));
                      }
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
}
