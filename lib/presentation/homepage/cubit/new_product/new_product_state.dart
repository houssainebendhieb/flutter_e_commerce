part of 'new_product_cubit.dart';

@immutable
sealed class NewProductState {}

final class NewProductInitial extends NewProductState {}

final class NewProductLoading extends NewProductState {}

final class NewProductFailure extends NewProductState {
  final String errorMessage;
  NewProductFailure({required this.errorMessage});
}

final class NewProductSucces extends NewProductState {
  final List<ProductEntity> list;
  NewProductSucces({required this.list});
}
