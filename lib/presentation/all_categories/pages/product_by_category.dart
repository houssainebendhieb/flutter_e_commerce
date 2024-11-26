import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/cubit/product/product_cubit.dart';
import 'package:flutter_e_commerce/common/widgets/custom_product_top_selling.dart';

class ProductByCategory extends StatelessWidget {
  final String categoryName;
  const ProductByCategory({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            ProductCubit()..getProductsByCategoryName(categoryName),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductSucces) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("List of Product",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("$categoryName(${state.list.length})",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return CustomProductTopSelling(
                                  productEntity: state.list[0]);
                            }),
                      )
                    ],
                  ));
            } else if (state is ProductFailure) {
              return Scaffold(
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("List of Product",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("$categoryName(0)",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 150,
                      ),
                      Center(
                        child: Text(state.errorMessage),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: Text("not found 404"));
          },
        ),
      ),
    );
  }
}
