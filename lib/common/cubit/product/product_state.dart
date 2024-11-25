part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductFailure extends ProductState {
  final String errorMessage;
  ProductFailure({required this.errorMessage});
}

final class ProductSucces extends ProductState {
  final List<ProductEntity> list;
  ProductSucces({required this.list});
}
