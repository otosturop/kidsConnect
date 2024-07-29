import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../login/view/login_view.dart';

class SplashViewModel extends ChangeNotifier {
  bool isLogin = false;
  bool _isLoading = false;

  Future<void> checkLogin(BuildContext context) async {
    setLoader();
    Future.delayed(const Duration(seconds: 5), () {
      debugPrint("Wait for 4 seconds");
      if (isLogin) {
      } else {
        Navigator.pushNamedAndRemoveUntil(context, LoginView.routeName, (route) => false);
      }
      setLoader();
    });
  }

  setLoader() {
    _isLoading = !_isLoading;
  }
}

final splashProvider = ChangeNotifierProvider((ref) => SplashViewModel());
