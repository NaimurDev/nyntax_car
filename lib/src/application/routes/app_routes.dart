import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyntax_car/src/core/utils/constants.dart';
import 'package:nyntax_car/src/presentation/not_found/not_found_page.dart';
import 'package:nyntax_car/src/presentation/reserve/additional_charge_page.dart';
import 'package:nyntax_car/src/presentation/reserve/customer_info_page.dart';
import 'package:nyntax_car/src/presentation/reserve/reservation_info_page.dart';
import 'package:nyntax_car/src/presentation/reserve/summary_page.dart';
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
      GoRoute(
        path: "/reserve_info_form",
        name: Routes.reserveInfoForm,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ReservationInfoPage(),
        ),
      ),
      GoRoute(
        path: "/customer_info",
        name: Routes.customerInfo,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CustomerInfoPage(),
        ),
      ),
      GoRoute(
        path: "/additional_charge",
        name: Routes.additionalCharge,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AdditionalChargePage(),
        ),
      ),
      GoRoute(
        path: "/reserve_summary",
        name: Routes.reserveSummary,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ReserveSummaryPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
