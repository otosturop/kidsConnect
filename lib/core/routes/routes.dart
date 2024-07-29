import 'package:flutter/cupertino.dart';

import '../../feature/media/view/media_view.dart';
import '../../feature/bottom_navigation/view/bottom_navigation_view.dart';
import '../../feature/home/view/home_view.dart';
import '../../feature/login/view/login_view.dart';
import '../../feature/splash/view/splash_view.dart';

Map<String, WidgetBuilder> routes = {
  SplashView.routeName: (context) => const SplashView(),
  LoginView.routeName: (context) => const LoginView(),
  HomeView.routeName: (context) => const HomeView(),
  MediaView.routeName: (context) => const MediaView(),
  BottomNavigationView.routeName: (context) => const BottomNavigationView(),
};
