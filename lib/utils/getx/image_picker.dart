import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'palette_gen.dart';

class ImagePickerController extends GetxController {
  final colorController = Get.put(PaletteGeneratorController());
  final imagePicker = ImagePicker();
  File? imageFile;
  final box = GetStorage();

  Future<void> pickImage(ImageSource source) async {
    XFile? pickedFile = await imagePicker.pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      box.write('imagePath', pickedFile.path);
    }
    update();
    colorController.updatePaletteGenerator(imageFile!);
  }

  void updateImagePath(String imagePath) {
    imageFile = File(imagePath);
    update();
  }
}
