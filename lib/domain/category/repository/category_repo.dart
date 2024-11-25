import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/domain/category/entity/category.dart';

abstract class CategoryRepository {
  Future<Either<String, List<CategoryEntity>>> getCategories();
}
