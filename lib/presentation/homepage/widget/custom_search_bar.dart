import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/cubit/product/product_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context.read<ProductCubit>().filter(value);
      },
      controller: context.read<ProductCubit>().searchController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        hintText: "Search",
      ),
    );
  }
}
