import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/data/auth/model/user_creation_request.dart';
import 'package:flutter_e_commerce/data/auth/model/user_sign_in.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreationRequest user);
  Future<Either> signIn(UserSignInRequest user);
  Future<Either> getAges();
  Future<Either> sendForgetPassword(String email);
  Future<bool> IsLoggedIn();
}
