import 'package:get/get.dart';

class KNNKualitasController extends GetxController {
  //berapa tetangga terdekat yang menjadi acuan
  int n = 5;
  String? kualitas;
  Future<void> getKualitas(List edList) async {
    var sum = 0;
    final int panjang = (n > edList.length) ? edList.length : n;
    for (var i = 0; i < panjang; i++) {
      sum = edList[i]['kualitas'] + sum;
    }
    //jika garam kualitas 1 'premium' lebih dominance
    //maka kualitas garam testing adalah 1
    if (sum > n / 2) {
      kualitas = 'Premium';
    } else {
      kualitas = 'Non-premium';
    }
    update();
  }
}
