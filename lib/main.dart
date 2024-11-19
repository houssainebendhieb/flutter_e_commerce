import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_theme.dart';
import 'package:flutter_e_commerce/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter_e_commerce/presentation/splash/pages/splash.dart';
import 'package:flutter_e_commerce/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await initializeDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        child: MaterialApp(
            theme: AppTheme.appTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashView()),
      )));
}