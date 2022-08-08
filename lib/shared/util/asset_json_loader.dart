import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class AssetJsonLoader {
  static Future<Map<String, dynamic>> loadJson(String assetFile) async {
    final data = await rootBundle.loadString(assetFile);

    return json.decode(data) as Future<Map<String, dynamic>>;
  }
}
