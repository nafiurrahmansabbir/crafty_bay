import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key, required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
        ),
      ),

    );
  }
}