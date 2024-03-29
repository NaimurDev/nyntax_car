import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyntax_car/src/core/utils/constants.dart';
import 'package:nyntax_car/src/presentation/not_found/not_found_page.dart';
import 'package:nyntax_car/src/presentation/splash/splash_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    initialLocation: "/",
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: "/",
        name: Routes.root,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SplashPage(),
        ),
      ),
      
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
