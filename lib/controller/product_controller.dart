import 'package:get/get.dart';
import 'package:sqflite_class_2nd_batch/database/database_helper.dart';
import 'package:sqflite_class_2nd_batch/model/product_model.dart';
import 'package:sqflite_class_2nd_batch/services/api_call.dart';

class ProductController extends GetxController {
  var loader = false.obs;

  var allProductList = RxList<ProductModel>().obs;

  final ProductRepository _productRepository = ProductRepository();
   DbHelper dbHelper = DbHelper();





   getData() async {
    loader.value = true;
    var apiData = await _productRepository.getProduct();
    print("Controller Response  Id ___${apiData!.length}");
    if (apiData != null) {
      allProductList.value.addAll(apiData);
      for (var element in allProductList.value) {
        DbHelper().createEmployee(element);
      }
      loader.value = false;
    }
  }
}
