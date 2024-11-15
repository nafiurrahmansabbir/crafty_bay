import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/home/product_card.dart';

class SpecialListScreen extends StatefulWidget {
  const SpecialListScreen({super.key});

  @override
  State<SpecialListScreen> createState() => _SpecialListScreenState();
}

class _SpecialListScreenState extends State<SpecialListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Special'),
      ),
      body:
      GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.70,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ProductCard(),
            );
          }),
    );
  }
}
