import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class KNNKualitasController extends GetxController {
  //berapa tetangga terdekat yang menjadi acuan
  int n = 5;

  final box = GetStorage();
  String? kualitas;
  void getKualitas(List edList) {
    var sum = 0;
    final int panjang = (n > edList.length) ? edList.length : n;
    for (var i = 0; i < panjang; i++) {
      sum = edList[i]['kualitas'] + sum;
    }

    //jika garam kualitas 1 'premium' lebih dominance
    //maka kualitas garam testing adalah Premium
    if (sum > n / 2) {
      kualitas = 'Premium';
    } else {
      kualitas = 'Non-premium';
    }
    update();

    //simpan status kualitas ke get storage
    box.write('kualitas', kualitas);
  }

  Future<void> updateKualitas(String kualitasData) async {
    kualitas = kualitasData;
    update();
  }

  void updateN(int nData) {
    n = nData;
    update();
    box.write('n', n);
  }
}
