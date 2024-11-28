import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';

class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(100)),
              height: 50,
              width: 50,
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                  child: Icon(Icons.arrow_back_ios))),
        ),
        InkWell(
          onTap: () {
            //
          },
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(100)),
              height: 50,
              width: 50,
              child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Icon(Icons.favorite_border))),
        ),
      ],
    );
  }
}
