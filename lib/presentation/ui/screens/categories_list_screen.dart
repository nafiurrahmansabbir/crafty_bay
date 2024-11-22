
import 'package:crafty_bay/presentation/state_holder/bottom_nav_bar_controller.dart';
import 'package:crafty_bay/presentation/state_holder/categories_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_card.dart';


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
      body: RefreshIndicator (
        onRefresh: () async{
          Get.find<CategoriesListController>().getCategoriesList();
        },
        child: GetBuilder<CategoriesListController>(
          builder: (categoriesListController) {

            if(categoriesListController.inProgress){
              return const CenterCircularProgressIndicator();
            }else if(categoriesListController.errorMessage!=null){
              return Center(child: Text(categoriesListController.errorMessage!),);
            }else{
              Center(child: Text(categoriesListController.errorMessage.toString()),);
            }
            return GridView.builder(
                itemCount: categoriesListController.categoriesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.90,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: CategoryCard(categoriesModel: categoriesListController.categoriesList[index],),
                  );
                });
          }
        ),
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}
