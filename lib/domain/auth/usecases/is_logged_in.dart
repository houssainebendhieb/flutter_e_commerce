import 'package:flutter_e_commerce/data/auth/usecases/usecase.dart';
import 'package:flutter_e_commerce/domain/auth/repository/auth_repo.dart';
import 'package:flutter_e_commerce/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().IsLoggedIn();
  }
}
