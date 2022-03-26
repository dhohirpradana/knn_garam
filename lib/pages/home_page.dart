import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knn_garam/utils/getx/image_picker.dart';
import 'package:knn_garam/utils/getx/knn.dart';
import 'package:knn_garam/utils/getx/knn_kualitas.dart';
import 'package:knn_garam/utils/show_picker.dart';
import 'package:knn_garam/widgets/button_style.dart';
import 'package:knn_garam/widgets/data_testing_color_widget.dart';
import 'package:knn_garam/widgets/spacer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // getx
  final controller = Get.put(ImagePickerController());
  final knnController = Get.put(KNNController());
  final kualitasController = Get.put(KNNKualitasController());

  final width = Get.width;
  final height = Get.height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        spacer(height: 10),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              //foto
              GetBuilder<ImagePickerController>(
                builder: (_) => (controller.imageFile == null)
                    ? Container(
                        child: const Center(
                          child: Text('Masukan Foto'),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: height / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width / 2,
                              child: Image.file(
                                controller.imageFile!,
                                height: height / 5,
                                cacheHeight: height ~/ 5,
                              ),
                            ),
                            DataTestingColorWidget()
                          ],
                        ),
                      ),
              ),
              spacer(height: 5),
              //button/tombol
              ElevatedButton(
                  style: AppButtonStyle.pickImageButton,
                  onPressed: () {
                    showPicker();
                  },
                  child: const Text('Pilih Foto')),
              spacer(height: 10),
              GetBuilder<KNNKualitasController>(
                builder: (_) => SizedBox(
                  // height: 100,
                  // width: 100,
                  // color: (colorController.paletteGenerator == null)
                  //     ? Colors.white
                  //     : colorController.paletteGenerator!.dominantColor!.color,
                  child: Center(
                    child: Text(
                      (kualitasController.kualitas == null)
                          ? 'Tidak ada foto'
                          : kualitasController.kualitas!.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              spacer(height: 10),
            ],
          ),
        ),

        //listview
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: GetBuilder<KNNController>(
              builder: (_) => (knnController.knn.isEmpty)
                  ? const SizedBox()
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: kualitasController.n,
                      itemBuilder: (context, index) {
                        double roundDouble(double value, int places) {
                          num mod = pow(10.0, places);
                          return ((value * mod).round().toDouble() / mod);
                        }

                        final h = roundDouble(
                            knnController.knn[index]['h'].toDouble(), 2);
                        final s = roundDouble(
                            knnController.knn[index]['s'].toDouble(), 2);
                        final l = roundDouble(
                            knnController.knn[index]['l'].toDouble(), 2);
                        final jarak =
                            roundDouble(knnController.knn[index]['jarak'], 2);
                        return ListTile(
                            tileColor:
                                (knnController.knn[index]['kualitas'] == 1)
                                    ? Colors.green[50]
                                    : Colors.red[50],
                            // leading: Text((index + 1).toString()),
                            title: Text(
                                (knnController.knn[index]['kualitas'] == 1)
                                    ? 'Premium'
                                    : 'Non-premium'),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex: 1,
                                    child: Text('Hue : ' + h.toString())),
                                Flexible(
                                    flex: 1,
                                    child:
                                        Text('Saturation : ' + s.toString())),
                                Flexible(
                                    flex: 1,
                                    child: Text('Lightness : ' + l.toString())),
                                Flexible(
                                    flex: 1,
                                    child: Text('Jarak : ' + jarak.toString())),
                              ],
                            ));
                      },
                    ),
            ),
          ),
        )
      ],
    );
  }
}
