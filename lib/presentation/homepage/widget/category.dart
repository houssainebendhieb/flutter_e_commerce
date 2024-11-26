import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/cubit/category/category_cubit.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategorLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategorySucces) {
            return Container(
              height: 100,
              child: ListView.separated(
                  separatorBuilder: ((context, index) => const SizedBox(
                        width: 15,
                      )),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categoryList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Text(state.categoryList[index].title,
                              style: const TextStyle(color: Colors.red)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(state.categoryList[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14))
                      ],
                    );
                  }),
            );
          }
          return Container();
        },
      ),
    );
  }
}
