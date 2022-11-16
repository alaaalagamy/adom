// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Send_Data_Login _$Send_Data_LoginFromJson(Map<String, dynamic> json) => Send_Data_Login(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$Send_Data_LoginToJson(Send_Data_Login instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

UserLoginResponse _$UserLoginResponseFromJson(Map<String, dynamic> json) => UserLoginResponse(
      user: User.fromJson(json),
    );

Map<String, dynamic> _$UserLoginResponseToJson(UserLoginResponse instance) => instance.user!.toJson();

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://34.125.115.60/main/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserLoginResponse> loginUser(sendDataLogin) async {
    FormData formData = FormData.fromMap({"email": sendDataLogin.email, 'password': sendDataLogin.password});
    var res = await _dio.post('${baseUrl}login/', data: formData);
    final value = UserLoginResponse.fromJson(res.data!);
    return value;
  }

  @override
  Future<List<ImagesAndVideos>> getImagesAndVideos() async {
    final result = await _dio.get('${baseUrl}items/',
        options: Options(headers: {
          "Authorization": "Bearer ${SharedValues.user?.token}",
        }));
    List res = result.data;
    return res.map((e) => ImagesAndVideos.fromJson(e)).toList();
  }

  @override
  Future<bool> uploadFile({required XFile file, @required Function(int, int)? sendProgress}) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({"i_file": await MultipartFile.fromFile(file.path, filename: fileName), "i_label": fileName});
    final result = await _dio
        .post('${baseUrl}items/',
            data: formData,
            onSendProgress: sendProgress,
            options: Options(headers: {
              "Authorization": "Bearer ${SharedValues.user?.token}",
            }))
        .catchError((e) {
      switch (e.runtimeType) {
        case DioError:
          print("error ${e.message}");
          break;
        default:
          break;
      }
    });
    if (result.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> uploadCarouselPlayList({required Map<String, dynamic> data}) async {
    final result = await _dio
        .post('${baseUrl}playlists/',
            data: jsonEncode(data),
            options: Options(headers: {
              "Authorization": "Bearer ${SharedValues.user?.token}",
              HttpHeaders.contentTypeHeader: "application/json",
            }))
        .catchError((e) {
      switch (e.runtimeType) {
        case DioError:
          print("error ${e.message}");
          break;
        default:
          break;
      }
    });
    if (result.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> updateLabel({required String newData, required String id}) async {
    Map data = {'i_label': newData};
    final result = await _dio
        .put('${baseUrl}item/$id/',
            data: data,
            options: Options(headers: {
              "Authorization": "Bearer ${SharedValues.user?.token}",
              HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
            }))
        .catchError((e) {
      switch (e.runtimeType) {
        case DioError:
          print("error ${e.message}");
          break;
        default:
          break;
      }
    });
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> addDevice({required Map<String, String> data}) async {
    final result = await _dio
        .post('${baseUrl}devices/',
            data: data,
            options: Options(headers: {
              "Authorization": "Bearer ${SharedValues.user?.token}",
              HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
            }))
        .catchError((e) {
      switch (e.runtimeType) {
        case DioError:
          print("error ${(e as DioError).error} =='${baseUrl}devices/=== ${e.type} === ${e.error} ");
          break;
        default:
          break;
      }
    });
    if (result.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<Device>> getDevices() async {
    final result = await _dio.get('${baseUrl}devices/',
        options: Options(headers: {
          "Authorization": "Bearer ${SharedValues.user?.token}",
        }));
    List res = result.data;
    return res.map((e) => Device.fromJson(e)).toList();
  }
}
