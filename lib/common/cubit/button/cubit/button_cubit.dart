import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/data/auth/usecases/usecase.dart';
import 'package:meta/meta.dart';
part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitial());

  Future<void> execute({dynamic params, required UseCase useCase}) async {
    emit(ButtonLoading());

    try {
      Either returnedData = await useCase.call(params: params);
      returnedData.fold((left) {
        emit(ButtonFailure(errorMessage: left));
      }, (right) {
        emit(ButtonSucces());
      });
    } catch (e) {
      emit(ButtonFailure(errorMessage: e.toString()));
    }
  }
}