import 'package:flutter/material.dart' show Widget;
import 'package:overlay_kit/overlay_kit.dart';


class LoadingProgress {

  LoadingProgress._init();
  late final Widget _defaultWidget;

  static final LoadingProgress _instance = LoadingProgress._init();

  static LoadingProgress get instance => _instance;

  static Future<void> loadingProgressInit({required Widget loadingWidget }) async {
    instance._defaultWidget = loadingWidget;
  }


  LoadingProgress.start({Widget? widget}) {
    OverlayLoadingProgress.start(
      widget: widget ?? instance._defaultWidget
    );
  }

  LoadingProgress.stop() {
    OverlayLoadingProgress.stop();
  }
}
