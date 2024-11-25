import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:flutter_e_commerce/data/auth/model/user.dart';
import 'package:flutter_e_commerce/data/auth/model/user_creation_request.dart';
import 'package:flutter_e_commerce/data/auth/model/user_sign_in.dart';
import 'package:flutter_e_commerce/data/auth/source/auth_firebase.dart';
import 'package:flutter_e_commerce/domain/auth/repository/auth_repo.dart';
import 'package:flutter_e_commerce/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signUp(UserCreationRequest user) {
    return sl<AuthFirebaseService>().signUp(user);
  }

  @override
  Future<Either> getAges() {
    return sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signIn(UserSignInRequest user) {
    return sl<AuthFirebaseService>().signIn(user);
  }

  @override
  Future<Either> sendForgetPassword(String email) {
    return sl<AuthFirebaseService>().sendForgetPassword(email);
  }

  @override
  Future<bool> IsLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    await sl<AuthFirebaseService>().getUser().fold((left) {
      return Left(left);
    }, (right) {
      return Right(UserModel.fromJson(right));
    });
    return const  Left("error");
  }
}
