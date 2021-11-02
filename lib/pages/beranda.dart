import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knn_garam/utils/getx/image_picker.dart';
import 'package:knn_garam/utils/getx/knn_kualitas.dart';
import 'package:knn_garam/utils/getx/palette_gen.dart';
import 'package:knn_garam/widgets/spacer.dart';

class BerandaPage extends StatelessWidget {
  BerandaPage({Key? key}) : super(key: key);

  // getx
  final controller = Get.put(ImagePickerController());
  final colorController = Get.put(PaletteGeneratorController());
  final kualitasController = Get.put(KNNKualitasController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                controller.pickImage(ImageSource.gallery);
              },
              child: const Text('Galeri')),
          spacer(height: 10),
          GetBuilder<ImagePickerController>(
            builder: (_) => (controller.imageFile == null)
                ? const Text(
                    'Tidak ada',
                    style: TextStyle(fontSize: 24),
                  )
                : Image.file(
                    controller.imageFile!,
                    height: 200,
                    cacheHeight: 200,
                  ),
          ),
          spacer(height: 10),
          GetBuilder<ImagePickerController>(
              builder: (_) => ElevatedButton(
                  onPressed: () {
                    controller.pickImage(ImageSource.camera);
                  },
                  child: const Text('Kamera'))),
          spacer(height: 10),
          GetBuilder<KNNKualitasController>(
            builder: (_) => Container(
              height: 100,
              width: 100,
              color: (colorController.paletteGenerator == null)
                  ? Colors.white
                  : colorController.paletteGenerator!.dominantColor!.color,
              child: Center(
                child: Text(
                  (kualitasController.kualitas == null)
                      ? '-'
                      : kualitasController.kualitas!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
