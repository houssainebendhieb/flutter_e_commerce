import 'package:either_dart/src/either.dart';
import 'package:flutter_e_commerce/data/category/models/category.dart';
import 'package:flutter_e_commerce/data/category/source/category_firebase.dart';
import 'package:flutter_e_commerce/domain/category/entity/category.dart';
import 'package:flutter_e_commerce/domain/category/repository/category_repo.dart';
import 'package:flutter_e_commerce/service_locator.dart';

class CategoryRepoImpl extends CategoryRepository {
  @override
  Future<Either<String,List<CategoryEntity>>> getCategories() async {
    var res = await sl<CategoryFirebase>().getCategories();
    return res.fold((left) => Left(left), (right) {
      List<CategoryEntity> list = List.from(
          right.map((e) => CategoryModel.fromMap(e.data()).toEntity()));
      print(list);
      return Right(list);
    });
  }
}
