//
// Generated file. Do not edit.
//

// ignore: unused_import
import 'dart:ui';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

void registerPlugins(PluginRegistry registry) {
  SharedPreferencesPlugin.registerWith(
      registry.registrarFor(SharedPreferencesPlugin));
  registry.registerMessageHandler();
}
