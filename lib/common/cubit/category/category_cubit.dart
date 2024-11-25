import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_e_commerce/domain/category/entity/category.dart';

import 'package:flutter_e_commerce/domain/category/usecases/get_category.dart';
import 'package:flutter_e_commerce/service_locator.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategorLoading());
    var response = sl<GetCategoryUseCase>().call();
    response.fold((left) {
      emit(CategoryFailure(errorMessage: left));
    }, (right) {
      emit(CategorySucces(categoryList: right as List<CategoryEntity>));
    });
  }
}
