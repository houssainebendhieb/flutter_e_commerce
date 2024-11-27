import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/cubit/product/product_cubit.dart';
import 'package:flutter_e_commerce/common/widgets/custom_product_top_selling.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/custom_search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ProductEntity> list = [];
  List<ProductEntity> fixedList = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: Scaffold(
        body: BlocBuilder<ProductCubit, ProductState>(
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
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  children: [
               
                    const CustomSearchBar(),
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: state.list.length * 3,
                          itemBuilder: (context, index) {
                            return CustomProduct(productEntity: state.list[0]);
                          }),
                    )
                  ],
                ),
              );
            }
            return const Text("not found 404");
          },
        ),
      ),
    );
  }
}
