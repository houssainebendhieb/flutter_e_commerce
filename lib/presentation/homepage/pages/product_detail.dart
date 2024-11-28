import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/common/widgets/helpers/app_bottomsheet.dart';
import 'package:flutter_e_commerce/core/configs/styles/text_styles.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';
import 'package:flutter_e_commerce/domain/product/entity/product.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/appbar.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/image_display.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/product_description.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductEntity productEntity;
  const ProductDetailScreen({super.key, required this.productEntity});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int count = 0;
  int indexColor = 0;
  String size = "S";
  Color productColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
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
                            Text(
                              "Size",
                              style: TextStyles.fontSize25,
                            ),
                            Row(
                              children: [
                                Text(size),
                                const SizedBox(
                                  width: 15,
                                ),
                                IconButton(
                                    onPressed: () {
                                      List<String> sizes = [
                                        "S",
                                        "M",
                                        "L",
                                        "XL"
                                      ];
                                      AppBottomsheet.display(
                                          context,
                                          SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.3,
                                            child: ListView(
                                              children: sizes
                                                  .map((e) => InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            size = e;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
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
                                                                padding: const EdgeInsets
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
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_sharp))
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
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: const Center(
                                        child: Text("+",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
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
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Center(
                                        child: Text("-",
                                            style: TextStyles.fontSize25),
                                      )),
                                ),
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
                              "Color",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            InkWell(
                              onTap: () {
                                List<MapEntry<String, Color>> colors = [];
                                colors.add(
                                    const MapEntry("orange", Colors.orange));
                                colors
                                    .add(const MapEntry("black", Colors.black));
                                colors.add(const MapEntry("blue", Colors.blue));
                                colors
                                    .add(const MapEntry("white", Colors.white));
                                AppBottomsheet.display(
                                    context,
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.3,
                                      child: ListView.builder(
                                        itemCount: colors.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                indexColor = index;
                                                productColor =
                                                    colors[index].value;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: indexColor != index
                                                        ? AppColors
                                                            .secondBackground
                                                        : Colors.blue[400],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(colors[index].key,
                                                            style: TextStyles
                                                                .fontSize25
                                                                .copyWith(
                                                                    fontSize:
                                                                        18)),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              height: 25,
                                                              width: 25,
                                                              decoration: BoxDecoration(
                                                                  color: colors[
                                                                          index]
                                                                      .value,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100)),
                                                            ),
                                                            const SizedBox(
                                                              width: 30,
                                                            ),
                                                            indexColor == index
                                                                ? const Icon(
                                                                    Icons.check,
                                                                    color: Colors
                                                                        .white)
                                                                : const SizedBox(
                                                                    width: 10,
                                                                  )
                                                          ],
                                                        )
                                                      ]),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ));
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: productColor,
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${widget.productEntity.price * count}\$",
                              style: TextStyles.fontSize25),
                          Text("Add To Cart",
                              style:
                                  TextStyles.fontSize25.copyWith(fontSize: 15))
                        ],
                      ),
                    ))),
          ])),
    );
  }
}
