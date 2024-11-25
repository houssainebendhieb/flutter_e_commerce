import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/cubit/category/category_cubit.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/custom_search_bar.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            header(),
            SizedBox(
              height: 25,
            ),
            CustomSearchBar(),
            BlocProvider(
              create: (context) => CategoryCubit()..getCategories(),
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategorLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CategorySucces) {
                    return Container(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categoryList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding:const  EdgeInsets.all(10),
                              width: 50,
                              height: 50,
                              child: Text(state.categoryList[index].title,
                                  style: const TextStyle(color: Colors.red)),
                            );
                          }),
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
