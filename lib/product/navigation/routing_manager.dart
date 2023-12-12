import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/landing/splash_screen/splash_screen.dart';
import 'package:flutter_base_project/features/navigation/unknown_route_screen/unknown_route_screen.dart';
import 'package:flutter_base_project/product/navigation/modules/auth_route.dart';
import 'package:flutter_base_project/product/navigation/modules/bottom_navigation_route.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

/// Routing Manager for module
class RoutingManager extends AbstractRoutingManager {
  RoutingManager._privateConstructor();

  static final RoutingManager _instance = RoutingManager._privateConstructor();

  /// Routing Manager instance
  static RoutingManager get instance => _instance;

  /// Parent navigator key
  static final GlobalKey<NavigatorState> parentKey = GlobalKey();

  /// Shell navigator key
  static final GlobalKey<NavigatorState> shellKey = GlobalKey();

  @override
  Future<void> restartApp() async {
    await Get.deleteAll();
    pushNamedAndRemoveUntil(name: 'splash');
  }

  @override
  void pushNamedAndRemoveUntil({required String name, Object? data}) {
    while (context!.canPop()) {
      context!.pop();
    }
    context!.pushReplacementNamed(name, extra: data);
  }

  /// Get the current context
  @override
  BuildContext? get context => parentKey.currentContext;

  final _router = GoRouter(
    observers: [NavigationHistoryObserver()],
    debugLogDiagnostics: true,
    initialLocation: '/',
    navigatorKey: parentKey,
    redirectLimit: 1,
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      AuthRoute.route,
      BottomNavigationRoute.route,
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: const UnknownRouteScreen(),
    ),
  );

  @override
  GoRouter get router => _router;

  @override
  RouterDelegate<Object> get routerDelegate => _router.routerDelegate;

  @override
  RouteInformationParser<Object> get routeInformationParser =>
      _router.routeInformationParser;
}
