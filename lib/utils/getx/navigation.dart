import 'package:get/get.dart';

class NavigationController extends GetxController {
  int selectedIndex = 0;
  String halamanText = 'BERANDA';
  void updateSelectedIndex(int index) {
    selectedIndex = index;
    halamanText = (index == 0)
        ? 'BERANDA'
        : (index == 1)
            ? 'DATA TRAINIG'
            : (index == 2)
                ? 'PENGATURAN'
                : 'TENTANG';
    update();
  }
}
