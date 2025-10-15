import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revbank/core/router/router.dart';
import 'package:revbank/core/utils/base_viewmodel.dart';

class SplashScreenViewModel extends BaseViewModel {
  Future startUp(BuildContext context) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    ).then(
      (value) => Navigator.pushNamed(
        // ignore: use_build_context_synchronously
        context,
        RoutePaths.signInview,
      ),
    );
  }
}

final splashScreenViewModel = ChangeNotifierProvider<SplashScreenViewModel>(
    (ref) => SplashScreenViewModel());
