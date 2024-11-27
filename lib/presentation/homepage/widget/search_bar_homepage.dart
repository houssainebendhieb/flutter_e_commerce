import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_navigator.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter_e_commerce/presentation/homepage/pages/search_page.dart';

class SearchBarHomePage extends StatelessWidget {
  const SearchBarHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.push(context, const SearchScreen());
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(25)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(children: [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            Text("Search", style: TextStyle(color: Colors.grey))
          ]),
        ),
      ),
    );
  }
}
