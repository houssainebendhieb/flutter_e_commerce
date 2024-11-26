import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';

abstract class ProductRepo {
  Future<Either<String, List<ProductEntity>>> getProducts();

  Future<Either<String, List<ProductEntity>>> getNewsProducts();
}
