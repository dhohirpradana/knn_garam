import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'knn.dart';

class PaletteGeneratorController extends GetxController {
  PaletteGenerator? paletteGenerator;
  final knnController = Get.put(KNNController());
  Future<void> updatePaletteGenerator(File file) async {
    //mengambil warna dari gambar
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.file(file).image,
    );
    update();
    knnController.hitungKNN(paletteGenerator!);
  }
}
