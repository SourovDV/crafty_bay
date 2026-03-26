import 'package:crafty_bay/app/appPages.dart';
import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/feature/data/category/product_model.dart';
import 'package:get/get.dart';

class CommonCategoriesControllers extends GetxController {
  void moveToCategoriesDetails() {
    Get.toNamed(AppPages.categoriesDetails);
  }

  RxList<ProductModel> productlist = <ProductModel>[].obs;

  Future<void> getAllCategoriesDetails() async {
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.product,
    );
    if (response.isSuccess) {
      List<ProductModel> lists = [];
      for(Map<String,dynamic> data in response.responsesData?["data"]["results"]??[]){
        lists.add(ProductModel.formJson(data));
      };
      productlist.addAll(lists);
    }
  }

  @override
  void onInit() {
    getAllCategoriesDetails();
    super.onInit();
  }
}
