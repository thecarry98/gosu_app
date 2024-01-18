import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_entity.freezed.dart';
part 'folder_entity.g.dart';

@freezed
class FolderEntity with _$FolderEntity {
  const factory FolderEntity({
    String? name,
    String? path,
    int? id,
    int? createAt,
  }) = _FolderEntity;

  factory FolderEntity.fromJson(Map<String, dynamic> json) => _$FolderEntityFromJson(json);
}
