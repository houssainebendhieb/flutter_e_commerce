import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/custom_button.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_navigator.dart';
import 'package:flutter_e_commerce/core/configs/styles/text_styles.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter_e_commerce/data/auth/model/user_creation_request.dart';
import 'package:flutter_e_commerce/presentation/auth/pages/gener_age.dart';
import 'package:flutter_e_commerce/presentation/auth/pages/signin.dart';
import 'package:flutter_e_commerce/presentation/auth/widget/custom_input_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
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
              custom_input_text_field(
                  hintText: "Firstname", controller: firstNameController),
              SizedBox(
                height: 10.h,
              ),
              custom_input_text_field(
                  hintText: "Lastname", controller: lastNameController),
              SizedBox(
                height: 10.h,
              ),
              custom_input_text_field(
                  hintText: "Email Address", controller: emailController),
              SizedBox(
                height: 10.h,
              ),
              custom_input_text_field(
                  hintText: "Password", controller: passwordController),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                  ontap: () {
                    UserCreationRequest userCreationRequest =
                        UserCreationRequest(
                            name: firstNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            lastName: lastNameController.text);
                    AppNavigator.push(
                        context,
                        GenerAge(
                          user: userCreationRequest,
                        ));
                  },
                  text: "continue"),
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
                      AppNavigator.pushReplacement(context, SignInView());
                    },
                    child: Text("Sign Up",
                        style: TextStyles.fontSize13
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
