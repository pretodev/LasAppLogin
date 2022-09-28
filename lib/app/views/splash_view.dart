import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rev_final/app/stores/auth_store.dart';

import '../../domain/auth/auth.dart';
import '../constants/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final AuthStore _authStore;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _authStore = AuthWidget.of(context);
      _authStore.addListener(() {
        if (_authStore.auth == Auth.authenticated) {
          Navigator.of(context).pushReplacementNamed(Routes.home);
        }
        if (_authStore.auth == Auth.unauthenticated) {
          Navigator.of(context).pushReplacementNamed(Routes.login);
        }
      });
      _authStore.loadAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Icon(
          Icons.flutter_dash,
          color: Colors.greenAccent,
          size: 172.0,
        ),
      ),
    );
  }
}
