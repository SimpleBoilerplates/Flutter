import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/http/http_override.dart';
import 'package:flutter_boilerplate/shared/util/logger.dart';
import 'package:flutter_boilerplate/shared/util/platform_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final platformType = detectPlatformType();

  runApp(
    ProviderScope(
      overrides: [
        platformTypeProvider.overrideWithValue(platformType),
      ],
      observers: [Logger()],
      child: App(),
    ),
  );
}
