import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/data/product/model/product.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';

abstract class ProductFirebaseService {
  Future<Either<String, List<ProductEntity>>> getProduts();

  Future<Either<String, List<ProductEntity>>> getNewsProduts();

  Future<Either<String, List<ProductEntity>>> getProductsByCategoryName(
      String categoryName);
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either<String, List<ProductEntity>>> getProduts() async {
    try {
      var response =
          await FirebaseFirestore.instance.collection("product").get();
      List<ProductEntity> list = List.from(response.docs.map(
        (e) => ProductModel.fromMap(e.data()).toEntity(),
      ));
      print(list);
      return Right(list);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductEntity>>> getNewsProduts() async {
    try {
      var response =
          await FirebaseFirestore.instance.collection("product").get();
      List<ProductEntity> list = List.from(response.docs.map(
        (e) => ProductModel.fromMap(e.data()).toEntity(),
      ));
      return Right(list);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductEntity>>> getProductsByCategoryName(
      String categoryName) async {
    try {
      var response = await FirebaseFirestore.instance
          .collection("product")
          .where("categoryId", isEqualTo: categoryName)
          .get();
      if (response.docs.isEmpty) {
        return const Left("No product");
      }
      List<ProductEntity> list = List.from(response.docs.map(
        (e) => ProductModel.fromMap(e.data()).toEntity(),
      ));

      return Right(list);
    } catch (e) {
      return Left(e.toString());
    }
  }


}
