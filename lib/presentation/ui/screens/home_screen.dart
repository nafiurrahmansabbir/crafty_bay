import 'package:crafty_bay/presentation/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/home/appBar_homePage.dart';

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
          onTap: () {},
        ),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
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
          onTap: () {},
        ),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
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
          onTap: () {},
        ),
        const SizedBox(
          height: 180,
          child: HorizontalProductListView(),
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
          onTap: () {},
        ),
        const SizedBox(height: 8),
        const SizedBox(
          height: 120,
          child: HorizontalCategoriesListView(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}