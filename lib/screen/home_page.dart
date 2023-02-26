
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_class_2nd_batch/controller/product_controller.dart';

import '../database/database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key ? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;
  final ProductController _controller = Get.put(ProductController());
  @override
  void initState() {
    _loadFromApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.brown,
        centerTitle: true,
        actions: <Widget>[
          // Container(
          //   padding: EdgeInsets.only(right: 10.0),
          //   child: IconButton(
          //     icon: Icon(Icons.settings_input_antenna),
          //     onPressed: () async {
          //       await _loadFromApi();
          //     },
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.only(right: 10.0),
          //   child: IconButton(
          //     icon: Icon(Icons.delete),
          //     onPressed: () async {
          //       await _deleteData();
          //     },
          //   ),
          // ),
        ],
      ),
      body:
      // Obx(() {
      //   if(_controller.loader.value){
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   }else{
      //     return ListView.builder(
      //       shrinkWrap: true,
      //       primary: false,
      //       itemCount: _controller.allProduct.value.length,
      //       itemBuilder: (_,index){
      //         var data = _controller.allProduct.value[index];
      //         return ListTile(
      //           title: Text("${data.title}"),
      //         );
      //       },
      //     );
      //   }
      // }),
      isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : buildProductData(),
    );
  }

  _loadFromApi() async {
    DbHelper().getProductdata();
    final  apiProvider = Get.put(ProductController());
    await apiProvider.getData();




  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    await DbHelper().deleteAllEmployees();

    // wait for 1 second to simulate loading of data
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    print('All employees deleted');
  }

  buildProductData() {
    return
      FutureBuilder(
        future: DbHelper().getProductdata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(

              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    "${index + 1}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  title: Text(
                      "Name: ${snapshot.data[index].title}"),
                );
              },
            );
          }
        },
      );
  }
}