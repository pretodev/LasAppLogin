import 'package:flutter/material.dart';
import 'package:rev_final/app/app.dart';
import 'package:rev_final/locator.dart' as locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  locator.setup();

  runApp(const AppWidget());
}
