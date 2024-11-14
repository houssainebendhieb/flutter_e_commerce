import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/configs/assets/app_vectors.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
          child: SvgPicture.asset(AppVectors.appLogo,
              semanticsLabel: 'Acme Logo')),
    );
  }
}
