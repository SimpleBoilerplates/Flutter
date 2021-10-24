import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final platformTypeProvider =
    Provider<PlatformType>((ref) => throw UnimplementedError());

enum PlatformType { iOS, Android, Windows, Web, Fuchsia, Linux, MacOS, Others }

PlatformType detectPlatformType() {
  PlatformType platformType;

  if (kIsWeb) {
    platformType = PlatformType.Web;
  } else {
    if (Platform.isAndroid) {
      platformType = PlatformType.Android;
    } else if (Platform.isIOS) {
      platformType = PlatformType.iOS;
    } else if (Platform.isMacOS) {
      platformType = PlatformType.MacOS;
    } else if (Platform.isWindows) {
      platformType = PlatformType.Windows;
    } else if (Platform.isLinux) {
      platformType = PlatformType.Linux;
    } else if (Platform.isFuchsia) {
      platformType = PlatformType.Fuchsia;
    } else {
      platformType = PlatformType.Android;
    }
  }

  return platformType;
}
