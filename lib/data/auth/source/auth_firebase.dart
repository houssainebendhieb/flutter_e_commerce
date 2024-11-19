import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_commerce/data/auth/model/user_creation_request.dart';
import 'package:flutter_e_commerce/data/auth/model/user_sign_in.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserCreationRequest user);
  Future<Either> signIn(UserSignInRequest user);
  Future<Either> getAges();
  Future<Either> sendForgetPassword(String email);
  Future<bool> isLoggedIn();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signUp(UserCreationRequest user) async {
    try {
      UserCredential responseReq = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);
      print(user);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(responseReq.user!.uid)
          .set({
        'firstname': user.name,
        'lastname': user.lastName,
        'email': user.email,
        'age': user.age,
        'gener': user.gener,
      });
      return const Right("succes");
    } on FirebaseAuthException catch (e) {
      return Left(e.toString());
    } catch (e) {
      return const Left("failed");
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var response = await FirebaseFirestore.instance.collection("ages").get();

      return Right(response.docs);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> signIn(UserSignInRequest user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: user.email!, password: user.password!);
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(e.toString());
    } catch (e) {
      return const Left("failed");
    }
  }

  @override
  Future<Either> sendForgetPassword(String email) async {
    try {
      print("hi");
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right("Succes");
    } on FirebaseAuthException catch (e) {
      return Left(e.toString());
    } catch (e) {
      return const Left("failed");
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }
}
