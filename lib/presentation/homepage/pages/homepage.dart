import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/cubit/category/category_cubit.dart';
import 'package:flutter_e_commerce/common/cubit/product/product_cubit.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/category.dart';
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
            SizedBox(
              height: 20,
            ),
            Category(),
            SizedBox(
              height: 15,
            ),
            BlocProvider(
              create: (context) => ProductCubit()..getProducts(),
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProductFailure) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else if (state is ProductSucces) {
                    return Container(
                        height: 250,
                        child: ListView.builder(
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 100,
                                width: 75,
                                child: Text(state.list[index].title),
                              );
                            }));
                  }
                  return Text("not found 404");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
