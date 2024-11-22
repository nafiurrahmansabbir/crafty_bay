
import 'package:crafty_bay/data/models/Categories/categories_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../category_card.dart';

class HorizontalCategoriesListView extends StatelessWidget {
  const HorizontalCategoriesListView({
    super.key, required this.categoryList,
  });

  final List<CategoriesModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return CategoryCard(categoriesModel: categoryList[index],);
        },
        separatorBuilder: (_, __) => const SizedBox(
              width: 8,
            ));
  }
}


