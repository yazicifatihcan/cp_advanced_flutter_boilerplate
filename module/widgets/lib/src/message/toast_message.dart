import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';

class ToastMessage {
  ToastMessage._init();
  late final Widget _defaultWidget;

  static final ToastMessage _instance = ToastMessage._init();

  static ToastMessage get instance => _instance;

  static Future<void> toastMessageInit({required Widget toastWidget}) async {
    instance._defaultWidget = toastWidget;
  }

  void showToastMessage({
    Widget? widget,
    int? duration,
  }) {
    OverlayToastMessage.show(
      widget: widget ?? _instance._defaultWidget,
      dismissAll: true,
      duration: Duration(seconds: duration ?? 2),
    );
  }
}
