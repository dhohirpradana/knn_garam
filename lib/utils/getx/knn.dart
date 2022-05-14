import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knn_garam/models/data_training.dart';
import 'package:knn_garam/utils/getx/knn_kualitas.dart';

class KNNController extends GetxController {
  final knnKualitasController = Get.put(KNNKualitasController());
  final box = GetStorage();
  List knn = [];
  void hitungKNN(List rgbhsl) {
    List edList = [];

    for (var i = 0; i < dataTraining.length; i++) {
      var hslTraining = HSLColor.fromColor(Color.fromRGBO(
          dataTraining[i]['r'], dataTraining[i]['g'], dataTraining[i]['b'], 1));
      //selisih diukuadratkan
      //hue distance/ jarak hue
      final hd = pow(hslTraining.hue / 360 - rgbhsl[3] / 360, 2);

      //jarak saturation
      final sd = pow(hslTraining.saturation - rgbhsl[4], 2);

      //jarak lightness
      final ld = pow(hslTraining.lightness - rgbhsl[5], 2);

      //eulidience distance
      //RUMUS : akar/ sqrt dari jumlah hd + sd + ld
      final double ed = sqrt(hd + sd + ld);
      edList.add(
        {
          'h': hslTraining.hue,
          's': hslTraining.saturation,
          'l': hslTraining.lightness,
          'jarak': ed,
          'kualitas': dataTraining[i]['q'],
        },
      );

      //sort dari terdekat
      edList.sort((a, b) => a['jarak'].compareTo(b['jarak']));
    }
    knn = edList;
    update();
    Navigator.of(Get.overlayContext!).pop();
    knnKualitasController.getKualitas(edList);
    box.write('knn', edList);
  }

  void updateKNN(List knnData) {
    knn = knnData;
    update();
  }
}
