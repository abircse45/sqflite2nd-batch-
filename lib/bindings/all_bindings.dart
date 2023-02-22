  import 'package:get/get.dart';
import 'package:sqflite_class_2nd_batch/controller/product_controller.dart';

class Allbindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ProductController());
  }

}