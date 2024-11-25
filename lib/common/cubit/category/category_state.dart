part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategorLoading extends CategoryState {}

final class CategorySucces extends CategoryState {
  final List<CategoryEntity> categoryList;
  CategorySucces({required this.categoryList});
}

final class CategoryFailure extends CategoryState {
  final String errorMessage;
  CategoryFailure({required this.errorMessage});
}
