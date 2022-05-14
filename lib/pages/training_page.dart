import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knn_garam/models/data_training.dart';
import 'package:knn_garam/pages/image_detail_page.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var items = dataTraining;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final image = (index < 31)
              ? 'lib/assets/premium/' + (index + 1).toString() + '.jpg'
              : 'lib/assets/non_premium/' + (index - 30).toString() + '.jpg';
          return ListTile(
            tileColor:
                (index.isEven) ? Colors.lightBlue[50] : Colors.transparent,
            leading: Text(
              (index + 1).toString(),
              style: const TextStyle(fontSize: 20),
            ),
            title: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.to(() => ImageDetailPage(imageData: image)),
                  child: Image.asset(
                    image,
                    height: Get.width / 5,
                    width: Get.width / 5,
                    fit: BoxFit.cover,
                    cacheWidth: 100,
                    cacheHeight: 100,
                  ),
                ),
                SizedBox(
                  width: Get.width / 10,
                ),
                Text(
                  (items[index]['q'] == 1) ? 'Premium' : 'Non-premium',
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
