import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';

class imagesDisplay extends StatelessWidget {
  const imagesDisplay({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: productEntity.images.length * 3,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productEntity.images[0]))),
              height: 280,
              width: 140,
            );
          }),
    );
  }
}
