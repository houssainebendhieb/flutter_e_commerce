import 'package:flutter/material.dart';

class custom_input_text_field extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const custom_input_text_field({
    required this.controller,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
