import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/custom_button.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_navigator.dart';
import 'package:flutter_e_commerce/core/configs/styles/text_styles.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter_e_commerce/presentation/auth/pages/signin_password.dart';
import 'package:flutter_e_commerce/presentation/auth/pages/sign_up.dart';
import 'package:flutter_e_commerce/presentation/auth/widget/custom_input_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Text("Sign in", style: TextStyles.fontSize30BoldWhite),
            SizedBox(
              height: 20.h,
            ),
            const custom_input_text_field(hintText: "Email Address"),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(
                ontap: () {
                  AppNavigator.push(context, const SignInPasswordView());
                },
                text: "Continue"),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Text("Dont't have an Account ? ",
                    style: TextStyles.fontSize13
                        .copyWith(color: Colors.grey.shade300)),
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(context, SignUpView());
                  },
                  child: Text("Create One",
                      style: TextStyles.fontSize13
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}