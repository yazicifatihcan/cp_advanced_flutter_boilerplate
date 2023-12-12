import 'package:flutter_base_project/features/landing/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';


/// Route Class for Auth Routes
class AuthRoute {
  AuthRoute._();

  
  ///auth path
  static const String auth = '/auth';

  /// Auth Router
  static final route = GoRoute(
    name: auth,
    path: '/auth',
    builder: (context, state) => const SplashScreen(),
  );
}
