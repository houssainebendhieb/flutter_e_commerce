import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/cubit/button/cubit/button_cubit.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_navigator.dart';
import 'package:flutter_e_commerce/common/widgets/reactive_button.dart';
import 'package:flutter_e_commerce/core/configs/styles/text_styles.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter_e_commerce/data/auth/model/user_sign_in.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/sign_in.dart';
import 'package:flutter_e_commerce/presentation/auth/pages/forget_password.dart';
import 'package:flutter_e_commerce/presentation/auth/widget/custom_input_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPasswordView extends StatelessWidget {
  final String email;
  SignInPasswordView({super.key, required this.email});
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocProvider(
          create: (context) => ButtonCubit(),
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailure) {
                var snackbar = SnackBar(content: Text(state.errorMessage));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              if (state is ButtonSucces) {
                var snackbar = const SnackBar(content: Text("succes"));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Text("Sign in", style: TextStyles.fontSize30BoldWhite),
                SizedBox(
                  height: 20.h,
                ),
                custom_input_text_field(
                    hintText: "Password", controller: passwordController),
                SizedBox(
                  height: 10.h,
                ),
                Builder(builder: (context) {
                  return ReactiveButton(
                      ontap: ()async {
                        UserSignInRequest userSignInRequest = UserSignInRequest(
                            email: email, password: passwordController.text);
                       await  context.read<ButtonCubit>().execute(
                            useCase: SignInUseCase(),
                            params: userSignInRequest);
                            
                      },
                      text: "Sign In");
                }),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Text("Forgot password ? ",
                        style: TextStyles.fontSize13
                            .copyWith(color: Colors.grey.shade300)),
                    GestureDetector(
                      onTap: () {
                        AppNavigator.push(context, ForgotPassword());
                      },
                      child: Text("Reset",
                          style: TextStyles.fontSize13
                              .copyWith(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
