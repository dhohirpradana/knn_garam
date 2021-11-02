import 'dart:math';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:knn_garam/models/data_training.dart';
import 'package:knn_garam/utils/getx/knn_kualitas.dart';
import 'package:palette_generator/palette_generator.dart';

class KNNController extends GetxController {
  final knnKualitasController = Get.put(KNNKualitasController());
  List knn = [];
  Future<void> hitungKNN(PaletteGenerator paletteGenerator) async {
    List edList = [];

    //convert warna data testing ke HSL
    var hsl = HSLColor.fromColor(paletteGenerator.dominantColor!.color);

    for (var i = 0; i < dataTraining.length; i++) {
      //hue distance/ jarak hue
      final hd =
          (dataTraining[i]['h'] - hsl.hue) * (dataTraining[i]['h'] - hsl.hue);

      //saturation
      final sd = ((dataTraining[i]['s'] - hsl.saturation) *
          (dataTraining[i]['s'] - hsl.saturation));

      //lightness
      final ld = ((dataTraining[i]['l'] - hsl.lightness) *
          (dataTraining[i]['l'] - hsl.lightness));

      //eulidience distance
      final ed = sqrt(hd + sd + ld);
      edList.add(
        {
          'jarak': ed,
          'kualitas': dataTraining[i]['q'],
        },
      );

      //sort dari terdekat
      edList.sort((a, b) => a['jarak'].compareTo(b['jarak']));
    }
    knn = edList;
    update();
    knnKualitasController.getKualitas(edList);
  }
}
