import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/Categories/categories_model.dart';
import '../utils/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoriesModel,
  });

  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12)),
          child: Image.network(categoriesModel.categoryImg.toString(),
            fit: BoxFit.cover,
          ),
          // child: const Icon(
          //   Icons.computer,
          //   size: 48,
          //   color: AppColors.themeColor,
          // ),
        ),
        const SizedBox(height: 4),
        Text(
          categoriesModel.categoryName ?? '',
          style: TextStyle(color: AppColors.themeColor),
        ),
      ],
    );
  }
}
