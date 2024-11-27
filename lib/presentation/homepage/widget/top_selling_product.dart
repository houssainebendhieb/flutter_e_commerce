import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/cubit/product/product_cubit.dart';
import 'package:flutter_e_commerce/common/widgets/custom_product_top_selling.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_navigator.dart';
import 'package:flutter_e_commerce/presentation/homepage/pages/product_detail.dart';

class TopSellingProduct extends StatelessWidget {
  const TopSellingProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                decoration: const BoxDecoration(color: Colors.black12),
                width: MediaQuery.sizeOf(context).width,
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          AppNavigator.push(
                              context,
                              ProductDetailScreen(
                                  productEntity: state.list[0]));
                        },
                        child: CustomProduct(productEntity: state.list[0]),
                      );
                    }));
          }
          return const Text("not found 404");
        },
      ),
    );
  }
}
