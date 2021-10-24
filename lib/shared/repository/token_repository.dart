import 'package:flutter_boilerplate/shared/constants/store_key.dart';
import 'package:flutter_boilerplate/shared/model/token.dart';
import 'package:flutter_boilerplate/shared/util/platform_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  return TokenRepository(ref: ref);
});

class TokenRepository {
  TokenRepository({required this.ref}) {
    platform = ref.read(platformTypeProvider);
  }

  late PlatformType platform;
  final ProviderRefBase ref;
  Token? _token;

  Future<void> remove() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();

    if (platform == PlatformType.iOS ||
        platform == PlatformType.Android ||
        platform == PlatformType.Linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.delete(key: StoreKey.token.toString());
      } on Exception catch (e) {}
    } else {
      await prefs.remove(StoreKey.token.toString());
    }

    await prefs.remove(StoreKey.user.toString());
  }

  Future<void> saveToken(Token token) async {
    final prefs = await SharedPreferences.getInstance();
    _token = token;
    if (platform == PlatformType.iOS ||
        platform == PlatformType.Android ||
        platform == PlatformType.Linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.write(
            key: StoreKey.token.toString(), value: tokenToJson(token));
      } on Exception catch (e) {}
    } else {
      await prefs.setString(StoreKey.token.toString(), tokenToJson(token));
    }
  }

  Future<Token?> fetchToken() async {
    // if (_token != null) {
    //   return _token;
    // }

    String? tokenValue;

    if (platform == PlatformType.iOS ||
        platform == PlatformType.Android ||
        platform == PlatformType.Linux) {
      const storage = FlutterSecureStorage();
      tokenValue = await storage.read(key: StoreKey.token.toString());
    } else {
      final prefs = await SharedPreferences.getInstance();
      tokenValue = prefs.getString(StoreKey.token.toString());
    }
    try {
      if (tokenValue != null) {
        _token = tokenFromJson(tokenValue);
      }
    } on Exception catch (e) {
      return _token;
    }

    return _token;
  }
}
