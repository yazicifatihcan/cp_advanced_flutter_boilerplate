import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/product/base/controller/base_controller.dart';
import 'package:flutter_base_project/product/managers/session_manager.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SplashController extends BaseControllerInterface{
  @override
  void onInit() {
    super.onInit();
    init();

  }

  @override
  void onReady() {
    onReadyGeneric(() async {
      await ready();
    });
  }

  void init() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    );

    /// telefonu çevirdiğimiz de sayfanın rotate olmaması için eklendi.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Future<void> ready() async {
    await Get.deleteAll();
    Get.put(SessionManager());

    await LocalAuthManager.initLocalAuthManager();


    context.go('/1st');
  }
}
