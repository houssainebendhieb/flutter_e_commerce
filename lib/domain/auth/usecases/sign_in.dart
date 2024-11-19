import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/data/auth/usecases/usecase.dart';
import 'package:flutter_e_commerce/domain/auth/repository/auth_repo.dart';
import 'package:flutter_e_commerce/service_locator.dart';

class SignInUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().signIn(params);
  }
}
