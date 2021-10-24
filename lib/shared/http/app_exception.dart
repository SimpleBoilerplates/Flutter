import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException.connectivity() = AppExceptionConnectivity;

  const factory AppException.unauthorized() = AppExceptionUnauthorized;

  const factory AppException.errorWithMessage(String message) =
      _AppExceptionErrorMessage;
  const factory AppException.error() = _AppExceptionError;
}
