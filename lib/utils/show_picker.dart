import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'getx/image_picker.dart';

final controller = Get.put(ImagePickerController());
void showPicker() {
  showModalBottomSheet(
      context: Get.overlayContext!,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Galeri'),
                  onTap: () {
                    controller.pickImage(ImageSource.gallery);
                    Navigator.of(Get.overlayContext!).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Kamera'),
                onTap: () {
                  controller.pickImage(ImageSource.camera);
                  Navigator.of(Get.overlayContext!).pop();
                },
              ),
            ],
          ),
        );
      });
}
