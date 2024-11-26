import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_navigator.dart';
import 'package:flutter_e_commerce/presentation/all_categories/pages/all_categories.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/category.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/custom_search_bar.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/header.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/news_product.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/top_selling_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const header(),
              const SizedBox(
                height: 25,
              ),
              const CustomSearchBar(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  InkWell(
                    onTap: () {
                      AppNavigator.push(context, const AllCategories());
                    },
                    child: const Text("See All",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 15)),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Category(),
              const SizedBox(
                height: 25,
              ),
              const Text("Top Selling",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const TopSellingProduct(),
              const SizedBox(
                height: 25,
              ),
              const Text("News",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const NewsProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
