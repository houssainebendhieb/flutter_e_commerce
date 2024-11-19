import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/cubit/button/cubit/button_cubit.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_navigator.dart';
import 'package:flutter_e_commerce/presentation/homepage/pages/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReactiveButton extends StatelessWidget {
  final void Function() ontap;
  final String text;
  const ReactiveButton({
    required this.text,
    required this.ontap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ButtonSucces) {
          AppNavigator.push(context, HomePage());
        }
        return InkWell(
          onTap: ontap,
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(25)),
            child: Center(
                child: Text(text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20))),
          ),
        );
      },
    );
  }
}
