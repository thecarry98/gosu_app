// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String folderName) createFolder,
    required TResult Function() setListFolder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String folderName)? createFolder,
    TResult? Function()? setListFolder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String folderName)? createFolder,
    TResult Function()? setListFolder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(CreateFolder value) createFolder,
    required TResult Function(SetListFolder value) setListFolder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(CreateFolder value)? createFolder,
    TResult? Function(SetListFolder value)? setListFolder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(CreateFolder value)? createFolder,
    TResult Function(SetListFolder value)? setListFolder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'HomeEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String folderName) createFolder,
    required TResult Function() setListFolder,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String folderName)? createFolder,
    TResult? Function()? setListFolder,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String folderName)? createFolder,
    TResult Function()? setListFolder,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(CreateFolder value) createFolder,
    required TResult Function(SetListFolder value) setListFolder,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(CreateFolder value)? createFolder,
    TResult? Function(SetListFolder value)? setListFolder,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(CreateFolder value)? createFolder,
    TResult Function(SetListFolder value)? setListFolder,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements HomeEvent {
  const factory Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$CreateFolderImplCopyWith<$Res> {
  factory _$$CreateFolderImplCopyWith(
          _$CreateFolderImpl value, $Res Function(_$CreateFolderImpl) then) =
      __$$CreateFolderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String folderName});
}

/// @nodoc
class __$$CreateFolderImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$CreateFolderImpl>
    implements _$$CreateFolderImplCopyWith<$Res> {
  __$$CreateFolderImplCopyWithImpl(
      _$CreateFolderImpl _value, $Res Function(_$CreateFolderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? folderName = null,
  }) {
    return _then(_$CreateFolderImpl(
      null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateFolderImpl implements CreateFolder {
  const _$CreateFolderImpl(this.folderName);

  @override
  final String folderName;

  @override
  String toString() {
    return 'HomeEvent.createFolder(folderName: $folderName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFolderImpl &&
            (identical(other.folderName, folderName) ||
                other.folderName == folderName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, folderName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFolderImplCopyWith<_$CreateFolderImpl> get copyWith =>
      __$$CreateFolderImplCopyWithImpl<_$CreateFolderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String folderName) createFolder,
    required TResult Function() setListFolder,
  }) {
    return createFolder(folderName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String folderName)? createFolder,
    TResult? Function()? setListFolder,
  }) {
    return createFolder?.call(folderName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String folderName)? createFolder,
    TResult Function()? setListFolder,
    required TResult orElse(),
  }) {
    if (createFolder != null) {
      return createFolder(folderName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(CreateFolder value) createFolder,
    required TResult Function(SetListFolder value) setListFolder,
  }) {
    return createFolder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(CreateFolder value)? createFolder,
    TResult? Function(SetListFolder value)? setListFolder,
  }) {
    return createFolder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(CreateFolder value)? createFolder,
    TResult Function(SetListFolder value)? setListFolder,
    required TResult orElse(),
  }) {
    if (createFolder != null) {
      return createFolder(this);
    }
    return orElse();
  }
}

abstract class CreateFolder implements HomeEvent {
  const factory CreateFolder(final String folderName) = _$CreateFolderImpl;

  String get folderName;
  @JsonKey(ignore: true)
  _$$CreateFolderImplCopyWith<_$CreateFolderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetListFolderImplCopyWith<$Res> {
  factory _$$SetListFolderImplCopyWith(
          _$SetListFolderImpl value, $Res Function(_$SetListFolderImpl) then) =
      __$$SetListFolderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetListFolderImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$SetListFolderImpl>
    implements _$$SetListFolderImplCopyWith<$Res> {
  __$$SetListFolderImplCopyWithImpl(
      _$SetListFolderImpl _value, $Res Function(_$SetListFolderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetListFolderImpl implements SetListFolder {
  const _$SetListFolderImpl();

  @override
  String toString() {
    return 'HomeEvent.setListFolder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetListFolderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String folderName) createFolder,
    required TResult Function() setListFolder,
  }) {
    return setListFolder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String folderName)? createFolder,
    TResult? Function()? setListFolder,
  }) {
    return setListFolder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String folderName)? createFolder,
    TResult Function()? setListFolder,
    required TResult orElse(),
  }) {
    if (setListFolder != null) {
      return setListFolder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(CreateFolder value) createFolder,
    required TResult Function(SetListFolder value) setListFolder,
  }) {
    return setListFolder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(CreateFolder value)? createFolder,
    TResult? Function(SetListFolder value)? setListFolder,
  }) {
    return setListFolder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(CreateFolder value)? createFolder,
    TResult Function(SetListFolder value)? setListFolder,
    required TResult orElse(),
  }) {
    if (setListFolder != null) {
      return setListFolder(this);
    }
    return orElse();
  }
}

abstract class SetListFolder implements HomeEvent {
  const factory SetListFolder() = _$SetListFolderImpl;
}
