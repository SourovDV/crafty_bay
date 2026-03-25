import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/feature/data/category/category_model.dart';
import 'package:crafty_bay/feature/screen/controller/item_controller/item_controller.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController{
  RxList<CategoryModel> list = <CategoryModel>[].obs;
  RxBool categoryProgress = false.obs;
  Future<void> getCategories()async{
    categoryProgress.value = true;
    NetworkResponse response =await Get.find<NetworkCaller>().getRequest(url: AppUrls.categories);
    categoryProgress.value = false;
    if(response.isSuccess){
      List<CategoryModel> lists = [];
      for(Map<String,dynamic> data in response.responsesData?["data"]["results"] ?? []){
        lists.add(CategoryModel.formJson(data));
      }
      list.addAll(lists);
      print("lists =>${lists}");
      print("list =>$list");
    }
  }


    void moveToHome(){
      Get.find<ItemController>().selectIndex.value = 0;
    }

}