import 'package:api/api.dart';
import 'package:common/common.dart';
import 'package:flutter_base_project/product/utility/enums/cache_enums.dart';
import 'package:get/get.dart';



class SessionManager extends GetxController {
  final Rx<GetUserInfoModel> _currentUser = GetUserInfoModel().obs;
  final Rx<bool?> _loggedIn = Rx<bool?>(null);
  String? _token;

  GetUserInfoModel get currentUser => _currentUser.value;

  set currentUser(GetUserInfoModel value) {
    _currentUser.firstRebuild = true;
    _currentUser.value = value;
  }

  String? getUserToken() {
    return _token ??= LocaleManager.instance.getStringValue(CacheKey.token.name);
  }

  Future<void> setUserToken(String value) async {
    await LocaleManager.instance.setStringValue(CacheKey.token.name, value);
    _token = value;
  }

  bool isUserLogin() {
    if (_loggedIn.value == null) {
      final bool value = LocaleManager.instance.getBoolValue(CacheKey.loggedIn.name) ?? false;
      _loggedIn.value = value;
    }
    return _loggedIn.value!;
  }

  Future<void> setLoggedIn(bool value) async {
    await LocaleManager.instance.setBoolValue(CacheKey.loggedIn.name, value);
    _loggedIn.value = value;
  }

  Future<void> logOut() async {
    await Future.wait([
      LocaleManager.instance.removeAt(CacheKey.token.name),
      setLoggedIn(false),
    ]);
    currentUser = GetUserInfoModel();
  }


  Future<void> logIn(GetUserInfoModel user) async {
    currentUser = user;
    await Future.wait([
      setLoggedIn(true),
      setUserToken(currentUser.token!),
    ]);
  }
}
