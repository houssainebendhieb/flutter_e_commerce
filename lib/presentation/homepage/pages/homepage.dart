import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/presentation/homepage/widget/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [header()],
        ),
      ),
    );
  }
}
