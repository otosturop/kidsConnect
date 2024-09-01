import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/routes/onGenerateRoute.dart';
import 'core/routes/routes.dart';
import 'core/theme/theme_constant.dart';
import 'feature/splash/view/splash_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kids Connect',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: SplashView.routeName,
      routes: routes,
      onGenerateRoute: generateRoute,
    );
  }
}
