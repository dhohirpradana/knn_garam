import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knn_garam/models/data_training.dart';
import 'package:knn_garam/utils/getx/knn.dart';
import 'package:knn_garam/utils/getx/knn_kualitas.dart';
import 'package:knn_garam/widgets/button_style.dart';
import 'package:line_icons/line_icons.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  final kualitasController = Get.put(KNNKualitasController());
  final knnController = Get.put(KNNController());
  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GetBuilder<KNNKualitasController>(
                builder: (_) => Text(
                      "N: " + kualitasController.n.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19),
                    )),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              autofocus: false,
              validator: (input) {
                if (input!.isEmpty) {
                  return 'tidak boleh kosong';
                } else if (input == '0') {
                  return 'tidak boleh 0';
                } else if (int.parse(input) < 0) {
                  return 'tidak boleh negatif';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: 'N (Banyak tetangga)',
                hintText: 'Tentukan banyak tetangga',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: const Icon(
                  LineIcons.hashtag,
                ),
              ),
            ),
            ElevatedButton(
              style: AppButtonStyle.pickImageButton,
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid
                  if (int.parse(controller.text) != kualitasController.n) {
                    kualitasController.updateN(
                        (int.parse(controller.text) > dataTraining.length)
                            ? dataTraining.length
                            : int.parse(controller.text));
                    kualitasController.getKualitas(knnController.knn);
                    FocusScope.of(context).requestFocus(FocusNode());
                    Get.snackbar("Berhasil", "SET NILAI N",
                        colorText: Colors.white,
                        backgroundColor: Colors.green[700],
                        snackPosition: SnackPosition.BOTTOM);
                  }
                }
              },
              child: const Text('SIMPAN'),
            ),
          ],
        ),
      ),
    );
  }
}
