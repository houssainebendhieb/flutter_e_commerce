import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_navigator.dart';
import 'package:flutter_e_commerce/core/configs/assets/app_vectors.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter_e_commerce/presentation/auth/pages/signin.dart';
import 'package:flutter_e_commerce/presentation/homepage/pages/homepage.dart';
import 'package:flutter_e_commerce/presentation/splash/cubit/splash_cubit.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return SignInView();
          }));
        } else if (state is Authenticated) {
          AppNavigator.pushReplacement(context, HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
            child: SvgPicture.asset(AppVectors.appLogo,
                semanticsLabel: 'Acme Logo')),
      ),
    );
  }
}
