import 'package:either_dart/either.dart';

import 'package:flutter_e_commerce/data/category/usecases/usecase.dart';
import 'package:flutter_e_commerce/domain/category/entity/category.dart';
import 'package:flutter_e_commerce/domain/category/repository/category_repo.dart';
import 'package:flutter_e_commerce/service_locator.dart';

class GetCategoryUseCase implements UseCase<Either<String,List<CategoryEntity>>, dynamic> {
  @override
  Future<Either<String,List<CategoryEntity>>> call({params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
}
