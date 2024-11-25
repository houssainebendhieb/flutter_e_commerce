import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/get_user.dart';
import 'package:meta/meta.dart';

part 'user_info_display_state.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoDisplayInitial());

  void displayUserInfo() async {
    var returnedData = await sl<GetUseUseCase>.call();
  }
}
