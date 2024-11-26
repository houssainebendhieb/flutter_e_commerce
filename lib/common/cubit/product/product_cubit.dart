import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';
import 'package:flutter_e_commerce/domain/product/usecase/get_product.dart';
import 'package:flutter_e_commerce/domain/product/usecase/get_product_by_category.dart';
import 'package:flutter_e_commerce/service_locator.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    var response = sl<GetProduct>().call();
    response.fold((left) => emit(ProductFailure(errorMessage: left)),
        (right) => emit(ProductSucces(list: right)));
  }

  Future<void> getProductsByCategoryName(String categoryName) async {
    emit(ProductLoading());
    var response =
        await GetProductByCategoryName(categoryName).call(params: categoryName);
    response.fold((left) => emit(ProductFailure(errorMessage: left)),
        (right) => emit(ProductSucces(list: right)));
  }
}
