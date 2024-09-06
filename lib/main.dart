import 'package:bookia_store_app/core/utils/themes.dart';
import 'package:bookia_store_app/feature/Welcom/welcom_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const WelcomeView(),
    );
  }
}
