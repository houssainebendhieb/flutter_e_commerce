// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_e_commerce/domain/product/entity/product.dart';


class ProductModel {
  final String categoryId;
  final int gender;
  final List < String > images;
  final num price;
  final String productId;
  final String title;

  ProductModel({
    required this.categoryId,

    required this.gender,
    required this.images,
    required this.price,
    required this.productId,
    required this.title
  });

 
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String,
     
    
      gender: map['gender'] as int,
      images: List < String >.from(
        map['images'].map((e) => e.toString()),
      ),
      price: map['price'] as num,
      
      productId: map['productId'] as String,
     
      title: map['title'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
   
      'gender': gender,
      'images': images.map((e) => e.toString()).toList(),
      'price': price,
  
      'productId': productId,
      'title': title,
    };
  }

}

extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      gender: gender,
      images: images, 
      price: price,
      productId: productId, 
      title: title
    );
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
      categoryId: categoryId,
      gender: gender,
      images: images, 
      price: price,
      productId: productId, 
      title: title
    );
  }
}