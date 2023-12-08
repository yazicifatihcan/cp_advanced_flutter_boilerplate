import 'dart:async';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/product/init/theme/color/light_colors.dart';
import 'package:flutter_base_project/product/managers/local_notification_handler.dart';
import 'package:flutter_base_project/product/service/product_client.dart';
import 'package:logger/logger.dart';
import 'package:resources/resources.dart';
import 'package:widgets/widget.dart';

class ApplicationInitialize {

  late EnvironmentConfigModel _config;
  
  Future<void> make(EnvironmentConfigModel config) async {
    _config = config;
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  Future<void> _initialize() async {
    
    WidgetsFlutterBinding.ensureInitialized();
    await LocaleManager.cacheInit();
    
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    
    // LocalNotificationHandler.instance;
    ProductClient.clientInit(_config);
    LoadingProgress.loadingProgressInit(loadingWidget: const CircularProgressIndicator());
    ToastMessage.toastMessageInit(toastWidget: const Text('This is a toast message'));
    AppStateController.init(
      colorPalettes: [LightColors()],
    );

    // FirebaseMessagingService.messagingInit(showNotification: (title,body)=>LocalNotificationHandler.instance.showNotification(title: title,body: body));

    await AppInfo.init();

    LocalNotificationHandler.instance;
    
    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };

  }

}
