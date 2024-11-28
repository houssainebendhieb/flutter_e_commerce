import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';

class descriptionProduct extends StatelessWidget {
  const descriptionProduct({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(productEntity.title,
            style: const TextStyle(color: Colors.white, fontSize: 22)),
        const SizedBox(
          height: 10,
        ),
        Text("\$${productEntity.price}",
            style: const TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
