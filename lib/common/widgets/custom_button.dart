import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final void Function() ontap;
  final String text;
  const CustomButton({
    required this.text,
    required this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(25)),
        child: Center(
            child: Text(text,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20))),
      ),
    );
  }
}
