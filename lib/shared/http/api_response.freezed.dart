// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$APIResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(AppException exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(AppException exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(APISuccess<T> value) success,
    required TResult Function(APIError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(APISuccess<T> value)? success,
    TResult Function(APIError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(APISuccess<T> value)? success,
    TResult Function(APIError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIResponseCopyWith<T, $Res> {
  factory $APIResponseCopyWith(
          APIResponse<T> value, $Res Function(APIResponse<T>) then) =
      _$APIResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$APIResponseCopyWithImpl<T, $Res>
    implements $APIResponseCopyWith<T, $Res> {
  _$APIResponseCopyWithImpl(this._value, this._then);

  final APIResponse<T> _value;
  // ignore: unused_field
  final $Res Function(APIResponse<T>) _then;
}

/// @nodoc
abstract class _$$APISuccessCopyWith<T, $Res> {
  factory _$$APISuccessCopyWith(
          _$APISuccess<T> value, $Res Function(_$APISuccess<T>) then) =
      __$$APISuccessCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class __$$APISuccessCopyWithImpl<T, $Res>
    extends _$APIResponseCopyWithImpl<T, $Res>
    implements _$$APISuccessCopyWith<T, $Res> {
  __$$APISuccessCopyWithImpl(
      _$APISuccess<T> _value, $Res Function(_$APISuccess<T>) _then)
      : super(_value, (v) => _then(v as _$APISuccess<T>));

  @override
  _$APISuccess<T> get _value => super._value as _$APISuccess<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$APISuccess<T>(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$APISuccess<T> implements APISuccess<T> {
  const _$APISuccess(this.value);

  @override
  final T value;

  @override
  String toString() {
    return 'APIResponse<$T>.success(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APISuccess<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$APISuccessCopyWith<T, _$APISuccess<T>> get copyWith =>
      __$$APISuccessCopyWithImpl<T, _$APISuccess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(AppException exception) error,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(AppException exception)? error,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(APISuccess<T> value) success,
    required TResult Function(APIError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(APISuccess<T> value)? success,
    TResult Function(APIError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(APISuccess<T> value)? success,
    TResult Function(APIError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class APISuccess<T> implements APIResponse<T> {
  const factory APISuccess(final T value) = _$APISuccess<T>;

  T get value;
  @JsonKey(ignore: true)
  _$$APISuccessCopyWith<T, _$APISuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$APIErrorCopyWith<T, $Res> {
  factory _$$APIErrorCopyWith(
          _$APIError<T> value, $Res Function(_$APIError<T>) then) =
      __$$APIErrorCopyWithImpl<T, $Res>;
  $Res call({AppException exception});

  $AppExceptionCopyWith<$Res> get exception;
}

/// @nodoc
class __$$APIErrorCopyWithImpl<T, $Res>
    extends _$APIResponseCopyWithImpl<T, $Res>
    implements _$$APIErrorCopyWith<T, $Res> {
  __$$APIErrorCopyWithImpl(
      _$APIError<T> _value, $Res Function(_$APIError<T>) _then)
      : super(_value, (v) => _then(v as _$APIError<T>));

  @override
  _$APIError<T> get _value => super._value as _$APIError<T>;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_$APIError<T>(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }

  @override
  $AppExceptionCopyWith<$Res> get exception {
    return $AppExceptionCopyWith<$Res>(_value.exception, (value) {
      return _then(_value.copyWith(exception: value));
    });
  }
}

/// @nodoc

class _$APIError<T> implements APIError<T> {
  const _$APIError(this.exception);

  @override
  final AppException exception;

  @override
  String toString() {
    return 'APIResponse<$T>.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$APIError<T> &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$APIErrorCopyWith<T, _$APIError<T>> get copyWith =>
      __$$APIErrorCopyWithImpl<T, _$APIError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(AppException exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(AppException exception)? error,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(AppException exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(APISuccess<T> value) success,
    required TResult Function(APIError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(APISuccess<T> value)? success,
    TResult Function(APIError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(APISuccess<T> value)? success,
    TResult Function(APIError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class APIError<T> implements APIResponse<T> {
  const factory APIError(final AppException exception) = _$APIError<T>;

  AppException get exception;
  @JsonKey(ignore: true)
  _$$APIErrorCopyWith<T, _$APIError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
