import 'package:get/get.dart';

class SingleProductDetailsController extends GetxController{
  RxInt initialIndex = 0.obs;


  RxInt initialData = 0.obs;
  void increment(){
    initialData++;
  }
  void decrement(){
    initialData--;
  }


}