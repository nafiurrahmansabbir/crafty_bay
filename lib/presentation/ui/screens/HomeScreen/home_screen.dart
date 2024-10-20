import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen/widgets/appBar_homePage.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen/widgets/build_categories_section.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen/widgets/home_banner_carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen/widgets/product_card.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen/widgets/search_textfield.dart';
import 'package:crafty_bay/presentation/ui/screens/HomeScreen/widgets/section_header.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utils/assets_path.dart';

import 'package:flutter/material.dart';

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
              const SizedBox(
                height: 16,
              ),
              const HomeBannerCarouselSlider(),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              buildCategoriesSection(),
              const SizedBox(height: 8),
              _buildPopularProductsSection(),
              _buildSpecialProductsSection(),
              _buildNewProductsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductsSection(){
    return Column(
      children: [
        SectionHeader(
          headerText: 'Popular',
          title: 'See all',
          onTap: () {},
        ),
        SizedBox(
          height: 180,
          child: _buildProductListView(),
        ),
      ],
    );
  }
  Widget _buildSpecialProductsSection(){
    return Column(
      children: [
        SectionHeader(
          headerText: 'Special',
          title: 'See all',
          onTap: () {},
        ),
        SizedBox(
          height: 180,
          child: _buildProductListView(),
        ),
      ],
    );
  }
  Widget _buildNewProductsSection(){
    return Column(
      children: [
        SectionHeader(
          headerText: 'New',
          title: 'See all',
          onTap: () {},
        ),
        SizedBox(
          height: 180,
          child: _buildProductListView(),
        ),
      ],
    );
  }



  ListView _buildProductListView() {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCard();
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: 8,
        ));
  }




  Widget buildCategoriesSection() {
    return Column(
      children: [
        SectionHeader(
          headerText: 'Categories',
          title: 'See all',
          onTap: () {},
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: _buildCategoryListView(),
        ),
      ],
    );
  }

  ListView _buildCategoryListView() {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12)),
                child: const Icon(
                  Icons.computer,
                  size: 48,
                  color: AppColors.themeColor,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Electronics',
                style: TextStyle(color: AppColors.themeColor),
              ),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
              width: 8,
            ));
  }



  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}


