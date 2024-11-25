import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/data/auth/entity/user.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/get_user.dart';
import 'package:meta/meta.dart';
import 'package:flutter_e_commerce/service_locator.dart';
part 'user_info_display_state.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoDisplayInitial());

  void displayUserInfo() async {
    emit(UserInfoDisplayLoading());
    var returnedData = await sl<GetUseUseCase>().call();
    returnedData.fold(
        (left) => emit(UserInfoDisplayFailure(errorMessage: left)),
        (right) => emit(UserInfoDisplaySucces(userEntity: right)));
  }
}
