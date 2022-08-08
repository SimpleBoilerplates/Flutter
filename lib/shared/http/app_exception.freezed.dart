// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unauthorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppExceptionConnectivity value) connectivity,
    required TResult Function(AppExceptionUnauthorized value) unauthorized,
    required TResult Function(_AppExceptionErrorMessage value) errorWithMessage,
    required TResult Function(_AppExceptionError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(_AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_AppExceptionError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(_AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_AppExceptionError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res> implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  final AppException _value;
  // ignore: unused_field
  final $Res Function(AppException) _then;
}

/// @nodoc
abstract class _$$AppExceptionConnectivityCopyWith<$Res> {
  factory _$$AppExceptionConnectivityCopyWith(_$AppExceptionConnectivity value,
          $Res Function(_$AppExceptionConnectivity) then) =
      __$$AppExceptionConnectivityCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppExceptionConnectivityCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$AppExceptionConnectivityCopyWith<$Res> {
  __$$AppExceptionConnectivityCopyWithImpl(_$AppExceptionConnectivity _value,
      $Res Function(_$AppExceptionConnectivity) _then)
      : super(_value, (v) => _then(v as _$AppExceptionConnectivity));

  @override
  _$AppExceptionConnectivity get _value =>
      super._value as _$AppExceptionConnectivity;
}

/// @nodoc

class _$AppExceptionConnectivity implements AppExceptionConnectivity {
  const _$AppExceptionConnectivity();

  @override
  String toString() {
    return 'AppException.connectivity()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppExceptionConnectivity);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unauthorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return connectivity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
  }) {
    return connectivity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppExceptionConnectivity value) connectivity,
    required TResult Function(AppExceptionUnauthorized value) unauthorized,
    required TResult Function(_AppExceptionErrorMessage value) errorWithMessage,
    required TResult Function(_AppExceptionError value) error,
  }) {
    return connectivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(_AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_AppExceptionError value)? error,
  }) {
    return connectivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(_AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_AppExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity(this);
    }
    return orElse();
  }
}

abstract class AppExceptionConnectivity implements AppException {
  const factory AppExceptionConnectivity() = _$AppExceptionConnectivity;
}

/// @nodoc
abstract class _$$AppExceptionUnauthorizedCopyWith<$Res> {
  factory _$$AppExceptionUnauthorizedCopyWith(_$AppExceptionUnauthorized value,
          $Res Function(_$AppExceptionUnauthorized) then) =
      __$$AppExceptionUnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppExceptionUnauthorizedCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$AppExceptionUnauthorizedCopyWith<$Res> {
  __$$AppExceptionUnauthorizedCopyWithImpl(_$AppExceptionUnauthorized _value,
      $Res Function(_$AppExceptionUnauthorized) _then)
      : super(_value, (v) => _then(v as _$AppExceptionUnauthorized));

  @override
  _$AppExceptionUnauthorized get _value =>
      super._value as _$AppExceptionUnauthorized;
}

/// @nodoc

class _$AppExceptionUnauthorized implements AppExceptionUnauthorized {
  const _$AppExceptionUnauthorized();

  @override
  String toString() {
    return 'AppException.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppExceptionUnauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unauthorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppExceptionConnectivity value) connectivity,
    required TResult Function(AppExceptionUnauthorized value) unauthorized,
    required TResult Function(_AppExceptionErrorMessage value) errorWithMessage,
    required TResult Function(_AppExceptionError value) error,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(_AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_AppExceptionError value)? error,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(_AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_AppExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class AppExceptionUnauthorized implements AppException {
  const factory AppExceptionUnauthorized() = _$AppExceptionUnauthorized;
}

/// @nodoc
abstract class _$$_AppExceptionErrorMessageCopyWith<$Res> {
  factory _$$_AppExceptionErrorMessageCopyWith(
          _$_AppExceptionErrorMessage value,
          $Res Function(_$_AppExceptionErrorMessage) then) =
      __$$_AppExceptionErrorMessageCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$_AppExceptionErrorMessageCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$_AppExceptionErrorMessageCopyWith<$Res> {
  __$$_AppExceptionErrorMessageCopyWithImpl(_$_AppExceptionErrorMessage _value,
      $Res Function(_$_AppExceptionErrorMessage) _then)
      : super(_value, (v) => _then(v as _$_AppExceptionErrorMessage));

  @override
  _$_AppExceptionErrorMessage get _value =>
      super._value as _$_AppExceptionErrorMessage;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_AppExceptionErrorMessage(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppExceptionErrorMessage implements _AppExceptionErrorMessage {
  const _$_AppExceptionErrorMessage(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AppException.errorWithMessage(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppExceptionErrorMessage &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_AppExceptionErrorMessageCopyWith<_$_AppExceptionErrorMessage>
      get copyWith => __$$_AppExceptionErrorMessageCopyWithImpl<
          _$_AppExceptionErrorMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unauthorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return errorWithMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
  }) {
    return errorWithMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (errorWithMessage != null) {
      return errorWithMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppExceptionConnectivity value) connectivity,
    required TResult Function(AppExceptionUnauthorized value) unauthorized,
    required TResult Function(_AppExceptionErrorMessage value) errorWithMessage,
    required TResult Function(_AppExceptionError value) error,
  }) {
    return errorWithMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(_AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_AppExceptionError value)? error,
  }) {
    return errorWithMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(_AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_AppExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (errorWithMessage != null) {
      return errorWithMessage(this);
    }
    return orElse();
  }
}

abstract class _AppExceptionErrorMessage implements AppException {
  const factory _AppExceptionErrorMessage(final String message) =
      _$_AppExceptionErrorMessage;

  String get message;
  @JsonKey(ignore: true)
  _$$_AppExceptionErrorMessageCopyWith<_$_AppExceptionErrorMessage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppExceptionErrorCopyWith<$Res> {
  factory _$$_AppExceptionErrorCopyWith(_$_AppExceptionError value,
          $Res Function(_$_AppExceptionError) then) =
      __$$_AppExceptionErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AppExceptionErrorCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$_AppExceptionErrorCopyWith<$Res> {
  __$$_AppExceptionErrorCopyWithImpl(
      _$_AppExceptionError _value, $Res Function(_$_AppExceptionError) _then)
      : super(_value, (v) => _then(v as _$_AppExceptionError));

  @override
  _$_AppExceptionError get _value => super._value as _$_AppExceptionError;
}

/// @nodoc

class _$_AppExceptionError implements _AppExceptionError {
  const _$_AppExceptionError();

  @override
  String toString() {
    return 'AppException.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AppExceptionError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() connectivity,
    required TResult Function() unauthorized,
    required TResult Function(String message) errorWithMessage,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? connectivity,
    TResult Function()? unauthorized,
    TResult Function(String message)? errorWithMessage,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppExceptionConnectivity value) connectivity,
    required TResult Function(AppExceptionUnauthorized value) unauthorized,
    required TResult Function(_AppExceptionErrorMessage value) errorWithMessage,
    required TResult Function(_AppExceptionError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(_AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_AppExceptionError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppExceptionConnectivity value)? connectivity,
    TResult Function(AppExceptionUnauthorized value)? unauthorized,
    TResult Function(_AppExceptionErrorMessage value)? errorWithMessage,
    TResult Function(_AppExceptionError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AppExceptionError implements AppException {
  const factory _AppExceptionError() = _$_AppExceptionError;
}
