import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/custom_button.dart';
import 'package:flutter_e_commerce/core/configs/styles/text_styles.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter_e_commerce/presentation/auth/widget/custom_input_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
            Text("Forgot Password", style: TextStyles.fontSize30BoldWhite),
            SizedBox(
              height: 20.h,
            ),
            const custom_input_text_field(hintText: "Enter Email"),
            SizedBox(
              height: 10.h,
            ),
            CustomButton(ontap: () {}, text: "Continue"),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
