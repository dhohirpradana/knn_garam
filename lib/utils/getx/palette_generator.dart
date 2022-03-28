import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palette_generator/palette_generator.dart';
import 'knn.dart';

class PaletteGeneratorController extends GetxController {
  PaletteGenerator? paletteGenerator;
  List rgbhsl = [];
  final box = GetStorage();
  final knnController = Get.put(KNNController());
  Future<void> updatePaletteGenerator(File file) async {
    //mengambil warna dari gambar
    paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.file(file).image,
    );
    final darkPopulation = (paletteGenerator!.darkMutedColor != null)
        ? paletteGenerator!.darkMutedColor!.population
        : 0;
    final color = (darkPopulation > 300)
        ? paletteGenerator!.darkMutedColor!.color
        : (paletteGenerator!.darkVibrantColor != null)
            ? paletteGenerator!.darkVibrantColor!.color
            : paletteGenerator!.dominantColor!.color;
    final hsl = HSLColor.fromColor(color);
    rgbhsl = [
      color.red,
      color.green,
      color.blue,
      hsl.hue,
      hsl.saturation,
      hsl.lightness
    ];
    update();
    box.write('rgbhsl', rgbhsl);
    knnController.hitungKNN(rgbhsl);
  }

  void getStorageRGBHSL(List rgbhslData) {
    rgbhsl = rgbhslData;
    update();
  }
}
