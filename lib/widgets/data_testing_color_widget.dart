import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knn_garam/utils/getx/palette_generator.dart';
import 'package:knn_garam/widgets/spacer.dart';
import 'package:knn_garam/widgets/substr.dart';

class DataTestingColorWidget extends StatefulWidget {
  const DataTestingColorWidget({Key? key}) : super(key: key);

  @override
  State<DataTestingColorWidget> createState() => _DataTestingColorWidgetState();
}

class _DataTestingColorWidgetState extends State<DataTestingColorWidget> {
  final colorController = Get.put(PaletteGeneratorController());
  bool isVisible = true;
  final IconData arrowDown =
      const IconData(0xe098, fontFamily: 'MaterialIcons');
  final IconData arrowRight = const IconData(0xe09e,
      fontFamily: 'MaterialIcons', matchTextDirection: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaletteGeneratorController>(
      builder: (_) => (colorController.rgbhsl.isEmpty)
          ? const SizedBox()
          : Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() => isVisible = !isVisible),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 3),
                    child: Row(
                      children: [
                        const Text(
                          "Data Testing",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Icon(isVisible ? arrowRight : arrowDown),
                      ],
                    ),
                  ),
                ),
                isVisible
                    ? SizedBox(
                        child: Column(
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
                      )
                    : const SizedBox()
              ],
            ),
    );
  }
}
