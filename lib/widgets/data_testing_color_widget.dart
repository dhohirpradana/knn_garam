import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knn_garam/utils/getx/palette_gen.dart';

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
                    Text('R : ' + colorController.rgbhsl[0].toString()),
                    Text('G : ' + colorController.rgbhsl[1].toString()),
                    Text('B : ' + colorController.rgbhsl[2].toString()),
                    Text('H : ' + colorController.rgbhsl[3].toString()),
                    Text('S : ' + colorController.rgbhsl[4].toString()),
                    Text('L : ' + colorController.rgbhsl[5].toString()),
                  ],
                ),
              ),
      ),
    );
  }
}
