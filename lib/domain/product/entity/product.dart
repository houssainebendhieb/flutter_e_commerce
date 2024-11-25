// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductEntity {
  final String categoryId;
  final int gender;
  final List < String > images;
  final num price;
  final String productId;
  final String title;

  ProductEntity({
    required this.categoryId,
    required this.gender,
    required this.images,
    required this.price,    required this.productId,
    required this.title
  });

}