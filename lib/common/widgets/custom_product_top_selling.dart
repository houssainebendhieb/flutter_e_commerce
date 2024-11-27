import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';

class CustomProduct extends StatelessWidget {
  final ProductEntity productEntity;
  const CustomProduct({
    required this.productEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 280,
        width: 160,
        decoration: BoxDecoration(
            color: const Color(0xff353040),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(productEntity.images[0]))),
              ),
            ),
            Text(productEntity.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
            Text("\$ " + productEntity.price.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17)),
          ],
        ),
      ),
    );
  }
}
