import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_theme.dart';
import 'package:flutter_e_commerce/presentation/splash/pages/splash.dart';

void main() {
  runApp(MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: SplashView()));
}
