import 'package:flutter/material.dart';
import 'package:rev_final/app/constants/routes.dart';
import 'package:rev_final/app/stores/auth_store.dart';

import '../locator.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';
import 'views/splash_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthWidget(
      authRepository: i(),
      child: MaterialApp(
        title: 'Las App',
        initialRoute: Routes.initial,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
        ),
        routes: {
          Routes.login: (_) => const LoginView(),
          Routes.home: (_) => const HomeView(),
          Routes.initial: (_) => const SplashView(),
          Routes.register: (_) => const RegisterView(),
        },
      ),
    );
  }
}
