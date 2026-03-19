import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/feature/data/slider_model/carosel_slider_model.dart';
import 'package:get/get.dart';

class SliderController extends GetxController{
  RxInt initialIndex = 0.obs;
  RxBool sliderProgress = false.obs;
  List<SliderModel> list = [];

  Future<void> getSlider()async{
    sliderProgress.value = true;
    NetworkResponse response =await Get.find<NetworkCaller>().getRequest(url: AppUrls.slides);
    sliderProgress.value = false;
    if(response.isSuccess){
      List<SliderModel> lists = [];
      for(Map<String,dynamic> json in response.responsesData?["data"]["results"] ??[]){
        lists.add(SliderModel.formJson(json));
      }
      list = lists;
    }
  }

}