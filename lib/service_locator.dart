import 'package:flutter_e_commerce/data/auth/repository/auth_repository_imp.dart';
import 'package:flutter_e_commerce/data/auth/source/auth_firebase.dart';
import 'package:flutter_e_commerce/data/category/repository/category_repo_imp.dart';
import 'package:flutter_e_commerce/data/category/source/category_firebase.dart';
import 'package:flutter_e_commerce/data/product/repository/product_repo_imp.dart';
import 'package:flutter_e_commerce/data/product/source/product_firebase_service.dart';
import 'package:flutter_e_commerce/domain/auth/repository/auth_repo.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/get_ages.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/get_user.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/is_logged_in.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/send_forget_password.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/sign_in.dart';
import 'package:flutter_e_commerce/domain/auth/usecases/signup.dart';
import 'package:flutter_e_commerce/domain/category/repository/category_repo.dart';
import 'package:flutter_e_commerce/domain/category/usecases/get_category.dart';
import 'package:flutter_e_commerce/domain/product/repository/product_repo.dart';
import 'package:flutter_e_commerce/domain/product/usecase/get_news_product.dart';
import 'package:flutter_e_commerce/domain/product/usecase/get_product.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // service
  sl.registerSingleton<CategoryFirebase>(CategoryFirebaseImpl());

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());

  //repos
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepoImpl());
  sl.registerSingleton<ProductRepo>(ProductRepoImpl());

  // Use Case
  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());

  sl.registerSingleton<GetCategoryUseCase>(GetCategoryUseCase());

  sl.registerSingleton<SignInUseCase>(SignInUseCase());

  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  sl.registerSingleton<GetUseUseCase>(GetUseUseCase());

  sl.registerSingleton<GetProduct>(GetProduct());

  sl.registerSingleton<GetNewsProduct>(GetNewsProduct());

  

  sl.registerSingleton<SendForgetPasswordUseCase>(SendForgetPasswordUseCase());
}
