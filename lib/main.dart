import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/home_page.dart';
import 'utils/getx/image_picker.dart';

Future<void> main() async {
  await GetStorage.init();
  final controller = Get.put(ImagePickerController());
  final box = GetStorage();
  final imagePath = box.read('imagePath');
  if (imagePath != '') {
    controller.updateImagePath(imagePath);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KNN GARAM KROSOK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
