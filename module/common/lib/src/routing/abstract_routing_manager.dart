import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

///Abstract class that will used for [GoRouter]
abstract class AbstractRoutingManager {
  
  ///Function to restart the app.
  Future<void> restartApp();

  ///Function that pop all available screens and pushreplacement last
  ///screen.
  void pushNamedAndRemoveUntil({required String name, Object? data});

  ///Context to use whole app from NavigatorKey.
  BuildContext? get context;

  ///GoRouter instance
  GoRouter get router;

  ///Router Delegate
  RouterDelegate<Object> get routerDelegate;

  ///RouteInformationParser
  RouteInformationParser<Object> get routeInformationParser;
}
