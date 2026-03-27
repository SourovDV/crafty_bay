import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/feature/data/category/category_model.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/item_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  RxInt currentPage = 0.obs;
  RxInt perPageCount = 30.obs;
  RxInt totalPage = 0.obs;
  RxBool initialProgress = true.obs;
  RxBool isProgress = false.obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  ScrollController scrollController = ScrollController();

  Future<bool> fetchCategories() async {
    if (totalPage.value != null && currentPage.value > totalPage.value) {
      return true;
    }
    bool isSuccess = false;
    currentPage.value++;
    if (!initialProgress.value) {
      isProgress.value = true;
    }
    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.categories,
      queryParams: {"count": perPageCount.value, "page": currentPage.value},
    );
    if (response.isSuccess) {
      List<CategoryModel> lists = [];
      for (Map<String, dynamic> data
          in response.responsesData!["data"]["results"]) {
        lists.add(CategoryModel.formJson(data));
      }
      isSuccess = true;
      totalPage.value = response.responsesData?["data"]?["last_page"] ?? 0;
      categoryList.addAll(lists);

    } else {
      Get.snackbar("false", "No data found");
    }
    if (!initialProgress.value) {
      isProgress.value = false;
    } else {
      initialProgress.value = false;
    }
    return isSuccess;
  }

  Future<void> reloadData() async {
    categoryList.value = [];
    initialProgress.value = true;
    currentPage.value = 0;
    fetchCategories();
    print("category print $categoryList");
  }

  void moveToHome() {
    Get.find<ItemController>().selectIndex.value = 0;
  }

  void loadMoreData() {
    if (scrollController.position.extentAfter < 300) {
      fetchCategories();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategories();
    scrollController.addListener(loadMoreData);
    super.onInit();
  }
}
