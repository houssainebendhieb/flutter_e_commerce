import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/is_logged_in.dart';
import 'package:flutter_e_commerce/service_locator.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 2));
    var isloggedin = await sl<IsLoggedInUseCase>().call();
    if (isloggedin) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
