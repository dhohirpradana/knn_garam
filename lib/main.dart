import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knn_garam/utils/getx/palette_gen.dart';
import 'pages/home_page.dart';
import 'utils/getx/image_picker.dart';
import 'utils/getx/knn.dart';
import 'utils/getx/knn_kualitas.dart';
import 'widgets/my_behavior.dart';

Future<void> main() async {
  //start get storage (Store Management)
  await GetStorage.init();

  //inisialisasi get yang ada di app
  final controller = Get.put(ImagePickerController());
  final knnController = Get.put(KNNController());
  final knnKualitasController = Get.put(KNNKualitasController());
  final paletteGeneratorController = Get.put(PaletteGeneratorController());

  //deklarasi get storage/ inisialisasi
  final box = GetStorage();

  //membaca data get storage
  final imagePath = box.read('imagePath');
  final knnData = box.read('knn');
  final kualitasData = box.read('kualitas');
  final rgbhsl = box.read('rgbhsl');
  final n = box.read('n');

  //jika data tidak kosong maka ...
  if (imagePath != null && imagePath != '') {
    controller.updateImagePath(imagePath);
    knnController.updateKNN(knnData);
    paletteGeneratorController.getStorageRGBHSL(rgbhsl);
    knnKualitasController.updateN(n);
    await knnKualitasController.updateKualitas(kualitasData);
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
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      home: HomePage(),
    );
  }
}
