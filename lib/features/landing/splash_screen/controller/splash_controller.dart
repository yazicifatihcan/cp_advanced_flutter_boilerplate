import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/product/base/controller/base_controller.dart';
import 'package:flutter_base_project/product/managers/session_manager.dart';
import 'package:flutter_base_project/product/widgets/message/custom_toast_message.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/widget.dart';

///Controller for Example Screen
class SplashController extends BaseControllerInterface {
  @override
  void onReady() {
    onReadyGeneric(() async {
      await ready();
    });
  }

  /// Function call to handle things in splash
  Future<void> ready() async {
    await Get.deleteAll();
    Get.put(SessionManager());

    await LocalAuthManager.initLocalAuthManager();

    await LoadingProgress.loadingProgressInit(
      loadingWidget: const CircularProgressIndicator(),
    );



    await ToastMessage.toastMessageInit(
      toastWidget: {
        ToastMessageType.success: ModuleToastMessage.success(),
        ToastMessageType.warning: ModuleToastMessage.warning(),
        ToastMessageType.error: ModuleToastMessage.error(),
      },
    );

    await safeOperation(() async => context.go('/1st'));
  }
}
