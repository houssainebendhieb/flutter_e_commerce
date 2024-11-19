import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/common/cubit/button/cubit/button_cubit.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_bottomsheet.dart';
import 'package:flutter_e_commerce/common/widgets/reactive_button.dart';
import 'package:flutter_e_commerce/core/configs/styles/text_styles.dart';
import 'package:flutter_e_commerce/data/auth/model/user_creation_request.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/signup.dart';
import 'package:flutter_e_commerce/presentation/auth/cubit/age/age_cubit.dart';
import 'package:flutter_e_commerce/presentation/auth/cubit/age_selection/age_selection_cubit.dart';
import 'package:flutter_e_commerce/presentation/auth/cubit/gener_selection/genre_selection_cubit.dart';
import 'package:flutter_e_commerce/presentation/auth/pages/ages.dart';
import 'package:flutter_e_commerce/presentation/auth/pages/genre_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenerAge extends StatelessWidget {
  const GenerAge({super.key, required this.user});
  final UserCreationRequest user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AgeCubit()),
          BlocProvider(create: (_) => AgeSelectionCubit()),
          BlocProvider(create: (_) => GenreSelectionCubit()),
          BlocProvider(create: (_) => ButtonCubit()),
        ],
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailure) {
              var snackbar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
            if (state is ButtonSucces) {
              var snackbar = const SnackBar(content: Text("succes"));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Tell us About yourself ",
                  style: TextStyles.fontSize30BoldWhite),
              SizedBox(
                height: 50.h,
              ),
              const Text("Who do you shop for ?",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 18.h,
              ),
              const GenreBloc(),
              SizedBox(
                height: 45.h,
              ),
              const Text(
                "How Old are you ?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15.h,
              ),
              BlocBuilder<AgeSelectionCubit, String>(
                builder: (context, state) {
                  return Container(
                    width: 360.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.shade700,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state,
                          ),
                          IconButton(
                            icon: const Icon(Icons.list),
                            onPressed: () {
                              AppBottomsheet.display(
                                  context,
                                  SizedBox(
                                      height: 250,
                                      child: MultiBlocProvider(providers: [
                                        BlocProvider.value(
                                          value: context.read<AgeCubit>()
                                            ..getAges(),
                                        ),
                                        BlocProvider.value(
                                            value: context
                                                .read<AgeSelectionCubit>()),
                                        BlocProvider.value(
                                            value: context
                                                .read<GenreSelectionCubit>()),
                                      ], child: Ages())));
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 250),
              Builder(builder: (context) {
                return ReactiveButton(
                    text: "finish",
                    ontap: () {
                      user.gener =
                          context.read<GenreSelectionCubit>().index == 0
                              ? "MEN"
                              : "WOMEN";
                      user.age = context.read<AgeCubit>().value;
                      print(user.age);
                      context
                          .read<ButtonCubit>()
                          .execute(useCase: SignupUseCase(), params: user);
                    });
              })
            ]),
          ),
        ),
      ),
    );
  }
}
