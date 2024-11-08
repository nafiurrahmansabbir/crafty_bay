import 'package:crafty_bay/presentation/ui/screens/review_screen.dart';
import 'package:crafty_bay/presentation/ui/utils/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

import '../widgets/color_picker.dart';
import '../widgets/product_image_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildProductDetails(),
          ),
          _buildPriceAndAddToCardSection()
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProductImageCarouselSlider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameAndQuantitySection(),
                const SizedBox(height: 1),
                _buildRatingAndReviewSection(),
                const SizedBox(height: 4),
                _buildColorPicker(),
                const SizedBox(height: 18),
                _buildSizePicker(),
                const SizedBox(height: 18),
                _buildDescriptionSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameAndQuantitySection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Text(
          'Nike shoes 2024 latest model - Happy New Year Special',
          style: Theme.of(context).textTheme.titleMedium,
        )),
        ItemCount(
          initialValue: 1,
          minValue: 0,
          maxValue: 20,
          decimalPlaces: 0,
          color: AppColors.themeColor,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildRatingAndReviewSection() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '3.9',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.themeColor,
              ),
            ),
          ],
        ),
        const SizedBox(width: 5),
        TextButton(
          onPressed: GoToReviewsScreen,
          child: const Text('Reviews'),
        ),
        const SizedBox(width: 5),
        Card(
          color: AppColors.themeColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(
              Icons.favorite_outline,
              size: 21,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSizePicker() {
    return SizePicker(
      sizes: const ['M', 'L', 'X', 'XL', 'XXL'],
      onSizeSelected: (String selectedSize) {},
    );
  }

  Widget _buildColorPicker() {
    return ColorPicker(
      colors: const [
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.purpleAccent
      ],
      onColorSelected: (Color selectedColor) {},
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          '''If you are in the business of selling shoes online, you know that effective shoe descriptions are crucial to making sales. You also know that writing good descriptions can be difficult, especially if you are starting a shoes ecommerce business. This blog post will give you tips and tricks on writing informative shoe descriptions that will help you sell more shoes. ''',
          style: TextStyle(color: Colors.black45),
        ),
        Text(
          '''If you are in the business of selling shoes online, you know that effective shoe descriptions are crucial to making sales. You also know that writing good descriptions can be difficult, especially if you are starting a shoes ecommerce business. This blog post will give you tips and tricks on writing informative shoe descriptions that will help you sell more shoes. ''',
          style: TextStyle(color: Colors.black45),
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCardSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildPriceSection(), _buildAddToCardButton()],
      ),
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Text(
          '\$120',
          style: TextStyle(fontSize: 17, color: AppColors.themeColor),
        )
      ],
    );
  }

  Widget _buildAddToCardButton() {
    return SizedBox(
        width: 140,
        child:
            ElevatedButton(onPressed: () {}, child: const Text('Add To Card')));
  }

  void GoToReviewsScreen() {
    if (mounted) {
      Get.to(() => const ReviewScreen());
    }
  }
}
