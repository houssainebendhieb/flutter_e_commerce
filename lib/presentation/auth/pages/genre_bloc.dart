import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/core/configs/styles/text_styles.dart';
import 'package:flutter_e_commerce/presentation/auth/cubit/gener_selection/genre_selection_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenreBloc extends StatelessWidget {
  const GenreBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
                child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: context.read<GenreSelectionCubit>().index == 0
                    ? Colors.blue
                    : Colors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
              child: InkWell(
                onTap: () {
                  context.read<GenreSelectionCubit>().changeGener(0);
                },
                child: Center(
                    child: Text("Men",
                        style: TextStyles.fontSize30BoldWhite
                            .copyWith(fontSize: 18))),
              ),
            )),
            const SizedBox(
              width: 25,
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                context.read<GenreSelectionCubit>().changeGener(1);
              },
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  color: context.read<GenreSelectionCubit>().index == 1
                      ? Colors.blue
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                    child: Text("Women",
                        style: TextStyles.fontSize30BoldWhite
                            .copyWith(fontSize: 18))),
              ),
            )),
          ],
        );
      },
    );
  }
}
