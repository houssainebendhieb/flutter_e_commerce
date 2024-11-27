import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_bottomsheet.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductEntity productEntity;
  const ProductDetailScreen({super.key, required this.productEntity});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int count = 0;
  String size = "S";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const header(),
              const SizedBox(
                height: 20,
              ),
              imagesDisplay(productEntity: widget.productEntity),
              const SizedBox(
                height: 25,
              ),
              descriptionProduct(productEntity: widget.productEntity),
              const SizedBox(
                height: 30,
              ),
              Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: AppColors.secondBackground,
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Size",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            Text(size),
                            const SizedBox(
                              width: 15,
                            ),
                            IconButton(
                                onPressed: () {
                                  List<String> sizes = ["S", "M", "L", "XL"];
                                  AppBottomsheet.display(
                                      context,
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.3,
                                        child: ListView(
                                          children: sizes
                                              .map((e) => InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        size = e;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5),
                                                      child: Container(
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .secondBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        25),
                                                            child: Row(
                                                              children: [
                                                                const Text(
                                                                    "Size :"),
                                                                Text(e),
                                                              ],
                                                            ),
                                                          )),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ));
                                },
                                icon:
                                    const Icon(Icons.keyboard_arrow_down_sharp))
                          ],
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: AppColors.secondBackground,
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Quantity",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                              },
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: const Center(
                                    child: Text("+",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  )),
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(count.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            const SizedBox(
                              width: 25,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (count > 0) {
                                    count--;
                                  }
                                });
                              },
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: const Center(
                                    child: Text("-",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}

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

class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.circular(100)),
            height: 50,
            width: 50,
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                child: Icon(Icons.arrow_back_ios))),
        Container(
            decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.circular(100)),
            height: 50,
            width: 50,
            child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(Icons.favorite_border))),
      ],
    );
  }
}
