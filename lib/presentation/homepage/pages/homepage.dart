import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/category.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/custom_search_bar.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/header.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/news_product.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/top_selling_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(
                height: 25,
              ),
              CustomSearchBar(),
              SizedBox(
                height: 20,
              ),
              Category(),
              SizedBox(
                height: 25,
              ),
              Text("Top Selling",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              TopSellingProduct(),
              SizedBox(
                height: 25,
              ),
              Text("News",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              NewsProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
