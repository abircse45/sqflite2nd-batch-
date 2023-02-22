import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite_class_2nd_batch/bindings/all_bindings.dart';
import 'package:sqflite_class_2nd_batch/screen/home_page.dart';

void main() {
  Allbindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

