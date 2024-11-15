import 'package:crafty_bay/controller_binder.dart';
import 'package:crafty_bay/presentation/state_holder/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({super.key});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        leading: IconButton(
          onPressed: backToHome,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GridView.builder(
          itemCount: 21,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(top: 16),
              child: CategoryCard(),
            );
          }),
    );
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}
