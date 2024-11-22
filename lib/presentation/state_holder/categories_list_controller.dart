import 'package:crafty_bay/data/models/Categories/categories_list_model.dart';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/utls/urls.dart';
import 'package:get/get.dart';

import '../../data/models/Categories/categories_model.dart';

class CategoriesListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<CategoriesModel> _categoriesList = [];
  List<CategoriesModel> get categoriesList => _categoriesList;

  Future<bool> getCategoriesList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    //
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: Urls.categoryListUrl);
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _categoriesList = CategoriesListModel.fromJson(response.responseData).categoriesList??[];
    } else {
      _errorMessage = response.errorMassage;
    }
    //
    _inProgress = false;
    update();
    return isSuccess;
  }
}
