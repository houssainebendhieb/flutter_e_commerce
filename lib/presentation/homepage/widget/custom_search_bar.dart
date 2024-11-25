import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        hintText: "Search",
      ),
    );
  }
}
