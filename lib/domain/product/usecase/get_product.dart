import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/data/product/usecase/product_usecase.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';
import 'package:flutter_e_commerce/domain/product/repository/product_repo.dart';
import 'package:flutter_e_commerce/service_locator.dart';

class GetProduct implements UseCase<Either, dynamic> {
  @override
  Future<Either<String, List<ProductEntity>>> call({params}) async {
    return await sl<ProductRepo>().getProducts();
  }
}
