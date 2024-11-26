import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/core/configs/theme/app_colors.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.secondBackground),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios,
                          color: Colors.grey.shade100)),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Shop by Categories",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.secondBackground,
                              borderRadius: BorderRadius.circular(10)),
                          height: 60,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(children: [
                              Icon(Icons.person),
                              SizedBox(
                                width: 20,
                              ),
                              Text("Hoodies",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ]),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
