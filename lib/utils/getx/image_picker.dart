import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'palette_gen.dart';

class ImagePickerController extends GetxController {
  final colorController = Get.put(PaletteGeneratorController());
  final imagePicker = ImagePicker();
  File? imageFile;

  Future<void> pickImage(ImageSource source) async {
    XFile? pickedFile = await imagePicker.pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
    }
    update();
    colorController.updatePaletteGenerator(imageFile!);
  }
}
