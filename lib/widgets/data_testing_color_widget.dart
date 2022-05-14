import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knn_garam/utils/getx/palette_generator.dart';
import 'package:knn_garam/widgets/spacer.dart';
import 'package:knn_garam/widgets/substr.dart';

class DataTestingColorWidget extends StatelessWidget {
  DataTestingColorWidget({Key? key}) : super(key: key);
  final colorController = Get.put(PaletteGeneratorController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaletteGeneratorController>(
      builder: (_) => (colorController.rgbhsl.isEmpty)
          ? const SizedBox()
          : SizedBox(
              // height: Get.height / 5,
              child:
                  // GridView.count(
                  //   crossAxisCount: 3,
                  //   children: [
                  //     // const Text('DATA FOTO'),
                  //     substr('R : ', colorController.rgbhsl[0]),
                  //     substr('G : ', colorController.rgbhsl[1]),
                  //     substr('B : ', colorController.rgbhsl[2]),
                  //     substr('H : ', colorController.rgbhsl[3]),
                  //     substr('S : ', colorController.rgbhsl[4]),
                  //     substr('L : ', colorController.rgbhsl[5])
                  //   ],
                  // )
                  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text('DATA FOTO'),
                  substr('Red : ', colorController.rgbhsl[0]),
                  spacer(height: 2),
                  substr('Green : ', colorController.rgbhsl[1]),
                  substr('Blue: ', colorController.rgbhsl[2]),
                  spacer(height: 2),
                  substr('Hue : ', colorController.rgbhsl[3]),
                  spacer(height: 2),
                  substr('Saturation : ', colorController.rgbhsl[4]),
                  spacer(height: 2),
                  substr('Lightness : ', colorController.rgbhsl[5])
                ],
              ),
            ),
    );
  }
}
