import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/presentation/homepage/cubit/user_info_display/user_info_display_cubit.dart';

class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoDisplayLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserInfoDisplayFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is UserInfoDisplaySucces) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                state.userEntity.image.isEmpty
                    ? const Icon(Icons.circle, color: Colors.blue)
                    : Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(100)),
                        child: ClipOval(
                            child: Image.network(state.userEntity.image))),
                Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(25)),
                    child: state.userEntity.gender == 1
                        ? const Text("MEN")
                        : const Text("WOMEN")),
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Center(
                      child: Icon(Icons.shop, color: Colors.white, size: 17),
                    )),
              ],
            );
          }
          return const Text("not found");
        },
      ),
    );
  }
}
