// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderEntityImpl _$$FolderEntityImplFromJson(Map<String, dynamic> json) =>
    _$FolderEntityImpl(
      name: json['name'] as String?,
      path: json['path'] as String?,
      id: json['id'] as int?,
      createAt: json['createAt'] as int?,
    );

Map<String, dynamic> _$$FolderEntityImplToJson(_$FolderEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'id': instance.id,
      'createAt': instance.createAt,
    };
