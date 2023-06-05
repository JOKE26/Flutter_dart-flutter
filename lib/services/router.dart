import 'package:appcours/screens/auth_screen.dart';
import 'package:appcours/screens/home_screen.dart';
import 'package:appcours/screens/second_screen.dart';
import 'package:appcours/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class RouterService {
  static GoRouter getRoutes() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'splash',
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: '/auth',
          name: 'auth',
          builder: (context, state) => AuthScreen(),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/second',
          name: 'second',
          builder: (context, state) => const SecondScreen(),
        ),
      ],
    );
  }
}
