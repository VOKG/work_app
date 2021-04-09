import 'package:get/get.dart';


class ViewSettingController extends  GetxController{
  final count =0.obs;
  increment()=> count.value++;
  decrement()=>count.value--;

}