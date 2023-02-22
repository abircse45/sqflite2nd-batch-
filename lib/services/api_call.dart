import 'package:sqflite_class_2nd_batch/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductModel>?> getProduct() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/"));

    if (response.statusCode == 200) {
      var jsondata = response.body;
      print("RESPONSE---${response.body}");

      return productModelFromJson(jsondata);
    } else {
      throw Exception("Something Went Wrong");
    }
  }
}
