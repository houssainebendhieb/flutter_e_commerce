import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/data/auth/model/user_creation_request.dart';
import 'package:flutter_e_commerce/data/auth/usecases/usecase.dart';
import 'package:flutter_e_commerce/domain/auth/repository/auth_repo.dart';
import 'package:flutter_e_commerce/service_locator.dart';

class SignupUseCase implements UseCase<Either, UserCreationRequest> {
  @override
  Future<Either> call({UserCreationRequest? params}) async {
    return await sl<AuthRepository>().signUp(params!);
  }

  Future<Either> getAges() async {
    return Right(await sl<AuthRepository>().getAges());
  }
}
