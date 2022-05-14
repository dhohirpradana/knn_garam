import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knn_garam/utils/getx/image_picker.dart';
import 'package:knn_garam/utils/getx/knn.dart';
import 'package:knn_garam/utils/getx/knn_kualitas.dart';
import 'package:knn_garam/utils/getx/palette_generator.dart';
import 'package:knn_garam/utils/show_picker.dart';
import 'package:knn_garam/widgets/data_testing_color_widget.dart';
import 'package:knn_garam/widgets/spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // getx
  final controller = Get.put(ImagePickerController());
  final colorController = Get.put(PaletteGeneratorController());
  final knnController = Get.put(KNNController());
  final kualitasController = Get.put(KNNKualitasController());
  final width = Get.width;
  final height = Get.height;

  bool isVisible = false;
  final IconData arrowDown =
      const IconData(0xe098, fontFamily: 'MaterialIcons');
  final IconData arrowRight = const IconData(0xe09e,
      fontFamily: 'MaterialIcons', matchTextDirection: true);

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
              GestureDetector(
                onTap: () {
                  showPicker();
                },
                child: GetBuilder<ImagePickerController>(
                  builder: (_) => (controller.imageFile == null)
                      ? Container(
                          child: const Center(
                            child: Text('Klik Untuk Masukan Foto'),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: height / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Center(
                            child: SizedBox(
                              width: width,
                              child: Image.file(
                                controller.imageFile!,
                                height: height / 4,
                                cacheHeight: height ~/ 4,
                                // width: width / 4, cacheWidth: width ~/ 4,
                              ),
                            ),
                            // DataTestingColorWidget()
                          ),
                        ),
                ),
              ),
              // spacer(height: 5),
              // //button/tombol
              // ElevatedButton(
              //     style: AppButtonStyle.pickImageButton,
              //     onPressed: () {
              //       showPicker();
              //     },
              //     child: const Text('Pilih Foto')),
              spacer(height: 3),
              GetBuilder<KNNKualitasController>(
                builder: (_) => Center(
                  child: Column(
                    children: [
                      const Divider(
                        thickness: 1.5,
                        color: Colors.black54,
                      ),
                      Text(
                        (kualitasController.kualitas == null)
                            ? '-'
                            : kualitasController.kualitas!.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              // spacer(height: 2),
              const DataTestingColorWidget(),
              spacer(height: 5),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => isVisible = !isVisible),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 3),
            child: Row(
              children: [
                const Text(
                  "Tetangga",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Icon(isVisible ? arrowRight : arrowDown),
              ],
            ),
          ),
        ),
        //listview
        isVisible
            ? Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
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
                              final jarak = roundDouble(
                                  knnController.knn[index]['jarak'], 2);
                              return ListTile(
                                  tileColor: (knnController.knn[index]
                                              ['kualitas'] ==
                                          1)
                                      ? Colors.green[50]
                                      : Colors.red[50],
                                  // leading: Text((index + 1).toString()),
                                  title: Text((knnController.knn[index]
                                              ['kualitas'] ==
                                          1)
                                      ? 'Premium'
                                      : 'Non-premium'),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          flex: 1,
                                          child: Text('Hue : ' + h.toString())),
                                      Flexible(
                                          flex: 1,
                                          child: Text(
                                              'Saturation : ' + s.toString())),
                                      Flexible(
                                          flex: 1,
                                          child: Text(
                                              'Lightness : ' + l.toString())),
                                      Flexible(
                                          flex: 1,
                                          child: Text(
                                              'Jarak : ' + jarak.toString())),
                                    ],
                                  ));
                            },
                          ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
