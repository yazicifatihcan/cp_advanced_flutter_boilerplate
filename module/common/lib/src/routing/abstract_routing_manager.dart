import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class AbstractRoutingManager {
  Future<void> restartApp();

  void pushNamedAndRemoveUntil({required String name, Object? data});

  BuildContext? get context;

  GoRouter get router;

  RouterDelegate<Object> get routerDelegate;

  RouteInformationParser<Object> get routeInformationParser;
}