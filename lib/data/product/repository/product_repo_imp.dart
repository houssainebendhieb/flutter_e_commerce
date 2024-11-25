import 'package:either_dart/src/either.dart';
import 'package:flutter_e_commerce/data/product/source/product_firebase_service.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';
import 'package:flutter_e_commerce/domain/product/repository/product_repo.dart';
import 'package:flutter_e_commerce/service_locator.dart';

class ProductRepoImpl extends ProductRepo {
  @override
  Future<Either<String,List<ProductEntity>>> getProducts() async {
    return await sl<ProductFirebaseService>().getProduts();
  }
}
