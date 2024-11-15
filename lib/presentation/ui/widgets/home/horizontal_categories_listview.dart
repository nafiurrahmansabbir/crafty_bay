import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../category_card.dart';

class HorizontalCategoriesListView extends StatelessWidget {
  const HorizontalCategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryCard();
        },
        separatorBuilder: (_, __) => const SizedBox(
              width: 8,
            ));
  }
}


