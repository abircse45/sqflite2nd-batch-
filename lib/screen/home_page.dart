import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_class_2nd_batch/controller/product_controller.dart';

class HomeScreen extends GetView<ProductController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.brown,
      ),
      body: Obx(() {
        if (controller.loader.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.brown,
            ),
          );
        } else {
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: controller.allProductList.value.length,
            itemBuilder: (context, index) {
              var data = controller.allProductList.value[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${data.title}"),
                        Text("${data.id}"),
                        Text("${data.userId}"),
                        Text("${data.completed}"),
                      ],
                    ),

                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
