import 'package:flutter_boilerplate/shared/constants/store_key.dart';
import 'package:flutter_boilerplate/shared/model/token.dart';
import 'package:flutter_boilerplate/shared/util/platform_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TokenRepositoryProtocol {
  Future<void> remove();
  Future<void> saveToken(Token token);
  Future<Token?> fetchToken();
}

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  return TokenRepository(ref);
});

class TokenRepository implements TokenRepositoryProtocol {
  TokenRepository(this._ref) {}

  late final PlatformType _platform = _ref.read(platformTypeProvider);
  final Ref _ref;
  Token? _token;

  @override
  Future<void> remove() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();

    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.delete(key: StoreKey.token.toString());
      } on Exception catch (e) {}
    } else {
      await prefs.remove(StoreKey.token.toString());
    }

    await prefs.remove(StoreKey.user.toString());
  }

  @override
  Future<void> saveToken(Token token) async {
    final prefs = await SharedPreferences.getInstance();
    _token = token;
    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
      const storage = FlutterSecureStorage();
      try {
        await storage.write(
            key: StoreKey.token.toString(), value: tokenToJson(token));
      } on Exception catch (e) {}
    } else {
      await prefs.setString(StoreKey.token.toString(), tokenToJson(token));
    }
  }

  @override
  Future<Token?> fetchToken() async {
    // if (_token != null) {
    //   return _token;
    // }

    String? tokenValue;

    if (_platform == PlatformType.iOS ||
        _platform == PlatformType.android ||
        _platform == PlatformType.linux) {
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
