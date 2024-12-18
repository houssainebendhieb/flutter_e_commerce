import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/widgets/custom_product_top_selling.dart';
import 'package:flutter_e_commerce/presentation/homepage/cubit/new_product/new_product_cubit.dart';

class NewsProduct extends StatelessWidget {
  const NewsProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewProductCubit()..getNewsProduct(),
      child: BlocBuilder<NewProductCubit, NewProductState>(
        builder: (context, state) {
          if (state is NewProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewProductFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is NewProductSucces) {
            return Container(
                decoration: const BoxDecoration(color: Colors.black12),
                width: MediaQuery.sizeOf(context).width,
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return CustomProduct(
                          productEntity: state.list[0]);
                    }));
          }
          return const Text("not found 404");
        },
      ),
    );
  }
}
