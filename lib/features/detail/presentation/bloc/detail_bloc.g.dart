// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DetailStateCWProxy {
  DetailState status(BaseStateStatus status);

  DetailState message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  DetailState call({
    BaseStateStatus? status,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDetailState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDetailState.copyWith.fieldName(...)`
class _$DetailStateCWProxyImpl implements _$DetailStateCWProxy {
  const _$DetailStateCWProxyImpl(this._value);

  final DetailState _value;

  @override
  DetailState status(BaseStateStatus status) => this(status: status);

  @override
  DetailState message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  DetailState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return DetailState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $DetailStateCopyWith on DetailState {
  /// Returns a callable class that can be used as follows: `instanceOfDetailState.copyWith(...)` or like so:`instanceOfDetailState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DetailStateCWProxy get copyWith => _$DetailStateCWProxyImpl(this);
}
