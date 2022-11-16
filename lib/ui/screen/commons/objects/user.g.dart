part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) => User(
    token: json['token'] as String,
    country: json['user']['country'] != null ? json['user']['country'] as String : '',
    country_str: json['user']['country_str'] != null ? json['user']['country_str'] as String : '',
    dob: json['user']['dob'] != null ? json['user']['dob'] as String : '',
    firstName: json['user']['first_name'] != null ? json['user']['first_name'] as String : '',
    lastName: json['user']['last_name'] != null ? json['user']['last_name'] as String : '',
    fullname: json['user']['fullname'] != null ? json['user']['fullname'] as String : '',
    gender: json['user']['gender'] != null ? json['user']['gender'] as String : '',
    gender_str: json['user']['gender_str'] != null ? json['user']['gender_str'] as String : '',
    pi_address: json['user']['pi_address'] != null ? json['user']['pi_address'] as String : '',
    devices: json['devices'] != null ? (json['devices'] as List<dynamic>).map((e) => Device.fromJson(e)).toList() : []);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'token': instance.token,
      'user': {
        'country': instance.country,
        'country_str': instance.country_str,
        'dob': instance.dob,
        'first_name': instance.firstName,
        'last_name': instance.lastName,
        'fullname': instance.fullname,
        'gender': instance.gender,
        'gender_str': instance.gender_str,
        'pi_address': instance.pi_address,
      }
    };
