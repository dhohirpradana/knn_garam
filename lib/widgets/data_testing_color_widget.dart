import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knn_garam/utils/getx/palette_gen.dart';
import 'package:knn_garam/widgets/substr.dart';

class DataTestingColorWidget extends StatelessWidget {
  DataTestingColorWidget({Key? key}) : super(key: key);
  final colorController = Get.put(PaletteGeneratorController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: GetBuilder<PaletteGeneratorController>(
        builder: (_) => (colorController.rgbhsl.isEmpty)
            ? const SizedBox()
            : SizedBox(
                height: Get.height / 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DATA FOTO'),
                    substr('R : ', colorController.rgbhsl[0]),
                    substr('G : ', colorController.rgbhsl[1]),
                    substr('B : ', colorController.rgbhsl[2]),
                    substr('H : ', colorController.rgbhsl[3]),
                    substr('S : ', colorController.rgbhsl[4]),
                    substr('L : ', colorController.rgbhsl[5])
                  ],
                ),
              ),
      ),
    );
  }
}
