import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/presentation/auth/cubit/age/age_cubit.dart';
import 'package:flutter_e_commerce/presentation/auth/cubit/age_selection/age_selection_cubit.dart';

class Ages extends StatelessWidget {
  Widget build(context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2,
      width: MediaQuery.sizeOf(context).width,
      child: BlocBuilder<AgeCubit, AgeState>(builder: (context, state) {
        if (state is AgeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AgeFailure) {
          return Text(state.message);
        } else if (state is AgeSucces) {
          return _ages(state.listAges);
        }
        return const Text("not found 404");
      }),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> listAges) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return InkWell(
              onTap: () {
                Navigator.pop(context);
                context
                    .read<AgeSelectionCubit>()
                    .changeAge(listAges[index].data()['value']);
              },
              child: Text(listAges[index].data()['value'].toString()));
        }),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: listAges.length);
  }
}