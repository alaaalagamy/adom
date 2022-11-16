import 'package:adom/shared/shared_values.dart';
part 'image_videos_object.g.dart';

class ImagesAndVideos {
  final num id;
  final String path;
  final String createdAt;
  final num createdBy;
  String thumbFile;
  final String label;

  ImagesAndVideos({required this.id, required this.path, required this.createdAt, required this.createdBy, this.thumbFile = '', required this.label});

  factory ImagesAndVideos.fromJson(Map<String, dynamic> json) => _$ImagesAndVideosFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesAndVideosToJson(this);
}
