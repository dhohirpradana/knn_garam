import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'lib/assets/image/umk_logo.png',
                height: Get.width / 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: 'Nama    : Siti Makhfuudlotur Rohmah')),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: 'NIM       : 201851080')),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: 'Progdi   : Teknik Informatika')),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
                text: const TextSpan(
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    text: 'Pengolahan Citra Untuk Klasifikasi Garam Krosok')),
            RichText(
                text: const TextSpan(
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    text: 'Menggunakan Metode KNN'))
          ],
        ),
      ),
    );
  }
}
