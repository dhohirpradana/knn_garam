import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knn_garam/utils/getx/image_picker.dart';
import 'package:knn_garam/utils/getx/knn.dart';
import 'package:knn_garam/utils/getx/knn_kualitas.dart';
import 'package:knn_garam/utils/getx/palette_gen.dart';
import 'package:knn_garam/widgets/spacer.dart';

class BerandaPage extends StatelessWidget {
  BerandaPage({Key? key}) : super(key: key);

  // getx
  final controller = Get.put(ImagePickerController());
  final colorController = Get.put(PaletteGeneratorController());
  final knnController = Get.put(KNNController());
  final kualitasController = Get.put(KNNKualitasController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.pickImage(ImageSource.camera);
                },
                child: const Text('Kamera')),
            spacer(width: 15),
            ElevatedButton(
                onPressed: () {
                  controller.pickImage(ImageSource.gallery);
                },
                child: const Text('Galeri')),
          ],
        ),
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
                    ? '-'
                    : kualitasController.kualitas!.toUpperCase(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: GetBuilder<KNNController>(
            builder: (_) => ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: kualitasController.n,
              itemBuilder: (context, index) {
                return ListTile(
                  tileColor: (knnController.knn[index]['kualitas'] == 1)
                      ? Colors.green[50]
                      : Colors.red[50],
                  leading: Text((index + 1).toString()),
                  title: Text((knnController.knn[index]['kualitas'] == 1)
                      ? 'Premium'
                      : 'Non-premium'),
                  subtitle: Text('Jarak : ' +
                      knnController.knn[index]['jarak'].toString()),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
