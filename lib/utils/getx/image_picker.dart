import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:knn_garam/utils/chooch.dart';
import 'knn.dart';
import 'knn_kualitas.dart';
import 'palette_generator.dart';

class ImagePickerController extends GetxController {
  final colorController = Get.put(PaletteGeneratorController());
  final knnController = Get.put(KNNController());
  final kualitasController = Get.put(KNNKualitasController());
  final imagePicker = ImagePicker();
  File? imageFile;
  final box = GetStorage();

  Future<void> pickImage(ImageSource source) async {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: const Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 7,
            ),
          ),
        ),
      ),
    );
    XFile? pickedFile = await imagePicker.pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
      );
      if (croppedFile != null) {
        imageFile = croppedFile;
        colorController.updatePaletteGenerator(croppedFile);
        box.write('imagePath', croppedFile.path);
        update();
      } else {
        Navigator.of(Get.overlayContext!).pop();
      }
    } else {
      Navigator.of(Get.overlayContext!).pop();
    }
    // if (imageFile != null) {
    // final choochData = await chooch(imageFile!);
    // if (choochData['predictions'].length == 0) {
    //   knnController.updateKNN([]);
    // Navigator.of(Get.overlayContext!).pop();
    //   kualitasController.updateKualitas('');
    //   Get.snackbar(
    //     "Info",
    //     "BUKAN FOTO GARAM",
    //     icon: const Icon(Icons.info, color: Colors.white),
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.red,
    //     borderRadius: 20,
    //     margin: const EdgeInsets.all(15),
    //     colorText: Colors.white,
    //     duration: const Duration(seconds: 4),
    //     isDismissible: true,
    //     dismissDirection: DismissDirection.horizontal,
    //     forwardAnimationCurve: Curves.easeOutBack,
    //   );
    //   imageFile = null;
    //   update();
    // } else {
    //   update();
    //   colorController.updatePaletteGenerator(imageFile!);
    // }
    // }
  }

  void updateImagePath(String imagePath) {
    imageFile = File(imagePath);
    update();
  }
}
