part of 'images_videos_object.dart';

ImagesAndVideos _$ImagesAndVideosFromJson(Map<String, dynamic> json) => ImagesAndVideos(
    id: json['id'] as num,
    path: '${SharedValues.apiBaseUrl}${json['i_file'] as String}',
    createdAt: json['created_at'] as String,
    createdBy: json['created_by'] as num,
    thumbFile: json['thumb_file'] != null ? '${SharedValues.apiBaseUrl}${json['thumb_file']}' : '',
    label: json['i_label'] ?? '');

Map<String, dynamic> _$ImagesAndVideosToJson(ImagesAndVideos instance) => <String, dynamic>{
      'id': instance.id,
      'i_file': instance.path,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'thumb_file': instance.thumbFile,
      'i_label': instance.label
    };
