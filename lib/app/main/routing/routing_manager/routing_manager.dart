import 'package:flutter/material.dart';
import 'package:flutter_base_project/features/unknown_route_screen/unknown_route_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/landing/splash_screen/splash_screen.dart';
import '../history_observer/navigation_history_observer.dart';
import 'modules/auth_route.dart';

class RoutingManager {
  RoutingManager._privateConstructor();

  static final RoutingManager _instance = RoutingManager._privateConstructor();
  static RoutingManager get instance => _instance;

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// Get the current context
  BuildContext?  get context => navigatorKey.currentContext;

  final _router = GoRouter( 
    observers: [NavigationHistoryObserver()],
    debugLogDiagnostics: true,
    initialLocation: '/',
    navigatorKey: navigatorKey,
    redirectLimit: 1,
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      AuthRoute.route,
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: const UnknownRouteScreen(),
    ),
  );

  GoRouter get router => _router;

  RouterDelegate<Object> get routerDelegate => _router.routerDelegate;

  RouteInformationParser<Object> get routeInformationParser => _router.routeInformationParser;
}