import 'package:flutter/material.dart';
import 'package:revbank/core/router/router.dart';
import 'package:revbank/views/dashboard/dashboard_screen.dart';
import 'package:revbank/views/sign_in_view.dart';
import 'package:revbank/views/sign_in_view2.dart';
import 'package:revbank/views/splash_view.dart';
import 'package:revbank/views/transaction_summary.dart';

class AppRouter {
  static PageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget viewToShow,
  }) {
    return MaterialPageRoute(
        builder: (context) => viewToShow, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable

    T? extractArguments<T>(RouteSettings settings) {
      return settings.arguments as T?;
    }

// Usage
    var routeArgs = extractArguments(settings);

    ////////////////////////////////////////////////////ONBOARDING///////////////////////////////////

    switch (settings.name) {
      case (RoutePaths.splashView):
        return _getPageRoute(
          settings: settings,
          viewToShow: const SplashView(),
        );
      case (RoutePaths.signInview):
        return _getPageRoute(
          settings: settings,
          viewToShow: const SignInView(),
        );
      case (RoutePaths.signInview2):
        var firstname = routeArgs[RouteArgumentKeys.firstname];
        var lastName = routeArgs[RouteArgumentKeys.lastName];
        var email = routeArgs[RouteArgumentKeys.email];

        return _getPageRoute(
          settings: settings,
          viewToShow: SignInView2(
            firstname: firstname,
            lastName: lastName,
            email: email,
          ),
        );
      case (RoutePaths.dashboard):
        var firstname = routeArgs[RouteArgumentKeys.firstname];
        var lastName = routeArgs[RouteArgumentKeys.lastName];
        var email = routeArgs[RouteArgumentKeys.email];
        var number = routeArgs[RouteArgumentKeys.number];

        return _getPageRoute(
          settings: settings,
          viewToShow: DashboardView(
            firstname: firstname,
            lastName: lastName,
            email: email,
            number: number,
          ),
        );
      case (RoutePaths.transaction):
        return _getPageRoute(
          settings: settings,
          viewToShow: const TransactionSummary(),
        );

      default:
        return _getPageRoute(
          settings: settings,
          viewToShow: const Scaffold(),
        );
    }
  }
}
