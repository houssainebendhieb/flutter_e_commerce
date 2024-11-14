import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_theme.dart';
import 'package:flutter_e_commerce/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter_e_commerce/presentation/splash/pages/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
            theme: AppTheme.appTheme,
            debugShowCheckedModeBanner: false,
            home: SplashView()),
      )));
}
