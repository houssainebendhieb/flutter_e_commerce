import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';
import 'package:flutter_e_commerce/domain/product/usecase/get_news_product.dart';
import 'package:flutter_e_commerce/service_locator.dart';
import 'package:meta/meta.dart';

part 'new_product_state.dart';

class NewProductCubit extends Cubit<NewProductState> {
  NewProductCubit() : super(NewProductInitial());

  Future<void> getNewsProducts() async {
    emit(NewProductLoading());
    var response = sl<GetNewsProduct>().call();
    response.fold((left) => emit(NewProductFailure(errorMessage: left)),
        (right) => emit(NewProductSucces(list: right)));
  }
}
