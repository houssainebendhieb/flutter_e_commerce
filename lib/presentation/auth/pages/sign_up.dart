import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/custom_button.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_navigator.dart';
import 'package:flutter_e_commerce/core/configs/styles/text_styles.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter_e_commerce/presentation/auth/pages/forget_password.dart';
import 'package:flutter_e_commerce/presentation/auth/pages/signin.dart';
import 'package:flutter_e_commerce/presentation/auth/widget/custom_input_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Text("Create Account", style: TextStyles.fontSize30BoldWhite),
            SizedBox(
              height: 20.h,
            ),
            const custom_input_text_field(hintText: "Firstname"),
            SizedBox(
              height: 10.h,
            ),
            const custom_input_text_field(hintText: "Lastname"),
            SizedBox(
              height: 10.h,
            ),
            const custom_input_text_field(hintText: "Email Address"),
            SizedBox(
              height: 10.h,
            ),
            const custom_input_text_field(hintText: "Password"),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(ontap: () {}, text: "Sign Up"),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Text("Do you have an account ? ",
                    style: TextStyles.fontSize13
                        .copyWith(color: Colors.grey.shade300)),
                GestureDetector(
                  onTap: () {
                    AppNavigator.pushReplacement(context, const SignInView());
                  },
                  child: Text("Sign IN",
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
