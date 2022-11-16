import 'package:adom/ui/screen/commons/objects/device.dart';

part 'user.g.dart';

class User {
  String? token;
  String? firstName;
  String? lastName;
  String? gender;
  String? gender_str;
  String? dob;
  String? country;
  String? fullname;
  String? country_str;
  String? pi_address;
  List<Device> devices;

  User(
      {required this.token,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.gender_str,
      required this.dob,
      required this.country,
      required this.fullname,
      required this.country_str,
      required this.pi_address,
      required this.devices});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
