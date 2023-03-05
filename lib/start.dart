import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/shared/util/logger.dart';
import 'package:flutter_boilerplate/shared/util/platform_type.dart';

import 'app/app.dart';

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final platformType = detectPlatformType();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en')],
    path: 'assets/lang',
    fallbackLocale: const Locale('en'),
    child: ProviderScope(overrides: [
      platformTypeProvider.overrideWithValue(platformType),
    ], observers: [
      Logger()
    ], child: const App()),
  ));
}
