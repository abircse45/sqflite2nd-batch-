import 'package:get/get.dart';
import 'package:sqflite_class_2nd_batch/model/product_model.dart';
import 'package:sqflite_class_2nd_batch/services/api_call.dart';

class ProductController extends GetxController {
  var loader = false.obs;

  var allProductList = RxList<ProductModel>().obs;

  final ProductRepository _productRepository = ProductRepository();


  @override
  void onInit() {
   getData();
    super.onInit();
  }


  void getData() async {
    loader.value = true;
    var apiData = await _productRepository.getProduct();
    if (apiData != null) {
      allProductList.value.addAll(apiData);
      loader.value = false;
    }
  }
}
