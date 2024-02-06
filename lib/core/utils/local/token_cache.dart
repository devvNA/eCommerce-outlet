import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/models/token/token_model.dart';

const String kTokenCacheKey = 'tokencache';

class TokenCacheService {
  Token? _token;
  Token? get token => _token;
  GetStorage get getStorage => Get.find<GetStorage>();

  Future<void> saveTokenToLocalStorage(Token token) async {
    final tokenNow =
        token.copyWith(tokenTime: DateTime.now().toIso8601String());
    var map = tokenNow.toJson();
    var saved = await getStorage.write(kTokenCacheKey, jsonEncode(map));
    _token = await getTokenFromLocalStorage();
    return saved;
  }

  Future<Token?> getTokenFromLocalStorage() async {
    Token tkn;
    var tokenMap = getStorage.read(kTokenCacheKey);
    if (tokenMap == null) {
      return null;
    }
    tkn = Token.fromJson(jsonDecode(tokenMap));
    _token = tkn;
    return tkn;
  }

  Future<void> deleteTokenFromLocalStorage() async {
    _token = null;
    return await getStorage.remove(kTokenCacheKey);
  }
}
