import 'package:crafty_bay/presentation/state_holder/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holder/categories_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/new_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/popular_product_list_controller.dart';
import 'package:crafty_bay/presentation/state_holder/special_product_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/new_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/popular_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/special_list_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController _searchTEController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarHome(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              SearchTextField(
                textEditingController: _searchTEController,
              ),
              const SizedBox(height: 16),
              const HomeBannerCarouselSlider(),
              const SizedBox(height: 16),
              buildCategoriesSection(),
              const SizedBox(height: 8),
              _buildPopularProductsSection(),
              const SizedBox(height: 16),
              _buildSpecialProductsSection(),
              const SizedBox(height: 16),
              _buildNewProductsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductsSection() {
    return Column(
      children: [
        SectionHeader(
          headerText: 'Popular',
          title: 'See all',
          onTap: () {
            Get.to(() => const PopularListScreen());
          },
        ),
        SizedBox(
          height: 180,
          child: GetBuilder<PopularProductListController>(
              builder: (popularProductListController) {
                return Visibility(
                    visible: !popularProductListController.inProgress,
                    replacement: const CenterCircularProgressIndicator(),
                    child: HorizontalProductListView(
                      productList: popularProductListController.popularProductList,
                    ));
              }),
        ),
      ],
    );
  }

  Widget _buildSpecialProductsSection() {
    return Column(
      children: [
        SectionHeader(
          headerText: 'Special',
          title: 'See all',
          onTap: () {
            Get.to(() => const SpecialListScreen());
          },
        ),
        SizedBox(
          height: 180,
          child: GetBuilder<SpecialProductListController>(
              builder: (specialProductListController) {
                return Visibility(
                    visible: !specialProductListController.inProgress,
                    replacement: const CenterCircularProgressIndicator(),
                    child: HorizontalProductListView(
                      productList: specialProductListController.productList,
                    ));
              }),
        ),
      ],
    );
  }

  Widget _buildNewProductsSection() {
    return Column(
      children: [
        SectionHeader(
          headerText: 'New',
          title: 'See all',
          onTap: () {
            Get.to(() => const NewListScreen());
          },
        ),
        SizedBox(
          height: 180,
          child: GetBuilder<NewProductListController>(
              builder: (newProductListController) {
            return Visibility(
                visible: !newProductListController.inProgress,
                replacement: const CenterCircularProgressIndicator(),
                child: HorizontalProductListView(
                  productList: newProductListController.productList,
                ));
          }),
        ),
      ],
    );
  }

  Widget buildCategoriesSection() {
    return Column(
      children: [
        SectionHeader(
          headerText: 'Categories',
          title: 'See all',
          onTap: () {
            Get.find<BottomNavBarController>().selectCategory();
          },
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 220,
          child: GetBuilder<CategoriesListController>(
              builder: (categoriesListController) {
            return Visibility(
              visible: !categoriesListController.inProgress,
              replacement: const CenterCircularProgressIndicator(),
              child: HorizontalCategoriesListView(
                categoryList: categoriesListController.categoriesList,
              ),
            );
          }),
        ),
      ],
    );
  }

// @override
// void dispose() {
//   _searchTEController.dispose();
//   super.dispose();
// }
}
