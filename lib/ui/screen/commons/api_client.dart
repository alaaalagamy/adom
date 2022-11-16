import 'dart:convert';
import 'dart:io';

import 'package:adom/shared/shared_values.dart';
import 'package:adom/ui/screen/Skins/objects/images_videos_object.dart';
import 'package:adom/ui/screen/commons/objects/device.dart';
import 'package:adom/ui/screen/commons/objects/user.dart';
import 'package:adom/ui/screen/devices/add_device.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://34.125.115.60/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("login/")
  Future<UserLoginResponse> loginUser(@Body() Send_Data_Login sendDataLogin);

  @GET("items/")
  Future<List<ImagesAndVideos>> getImagesAndVideos();

  @POST("items/")
  Future<bool> uploadFile({required XFile file, @required Function(int, int)? sendProgress});

  @POST("playlists/")
  Future<bool> uploadCarouselPlayList({required Map<String, dynamic> data});

  @PUT("item/")
  Future<bool> updateLabel({required String newData, required String id});

  @POST("devices/")
  Future<bool> addDevice({required Map<String, String> data});

  @GET("devices/")
  Future<List<Device>> getDevices();
}

@JsonSerializable()
class Send_Data_Login {
  String? email;
  String? password;

  Send_Data_Login({
    this.email,
    this.password,
  });

  factory Send_Data_Login.fromJson(Map<String, dynamic> json) => _$Send_Data_LoginFromJson(json);
  Map<String, dynamic> toJson() => _$Send_Data_LoginToJson(this);
}

@JsonSerializable()
class UserLoginResponse {
  User? user;

  UserLoginResponse({
    this.user,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => _$UserLoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginResponseToJson(this);
}
