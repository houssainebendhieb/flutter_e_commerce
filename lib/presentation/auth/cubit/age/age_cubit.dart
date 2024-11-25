import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/get_ages.dart';
import 'package:flutter_e_commerce/service_locator.dart';
import 'package:meta/meta.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  AgeCubit() : super(AgeInitial());
  int value = 0;

  void getAges() {
    try {
      emit(AgeLoading());
      var respones = sl<GetAgesUseCase>().call();

      respones.fold(
        (left) {
          emit(AgeFailure(message: left));
        },
        (right) {
          emit(AgeSucces(listAges: right));
        },
      );
    } catch (e) {
      emit(AgeFailure(message: e.toString()));
    }
  }
}
