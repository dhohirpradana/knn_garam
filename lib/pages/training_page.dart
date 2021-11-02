import 'package:flutter/material.dart';
import 'package:knn_garam/models/data_training.dart';

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
          return ListTile(
            tileColor:
                (index.isEven) ? Colors.lightBlue[50] : Colors.transparent,
            leading: Text((index + 1).toString()),
            title: const Text('Gambar'),
            subtitle:
                Text((items[index]['q'] == 1) ? 'Premium' : 'Non-premium'),
          );
        },
      ),
    );
  }
}
