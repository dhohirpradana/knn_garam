import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:knn_garam/pages/home_page.dart';
import 'package:knn_garam/pages/info_page.dart';
import 'package:knn_garam/pages/setting_page.dart';
import 'package:knn_garam/pages/training_page.dart';
import 'package:knn_garam/utils/getx/navigation.dart';
import 'package:knn_garam/widgets/color.dart';
import 'package:line_icons/line_icons.dart';

class FoundationPage extends StatelessWidget {
  FoundationPage({Key? key}) : super(key: key);

  // getx
  final navigationController = Get.put(NavigationController());

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const TrainingPage(),
    SettingPage(),
    const InfoPage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: GetBuilder<NavigationController>(
              builder: (_) => Text(navigationController.halamanText)),
          backgroundColor: AppColor.primaryColor,
        ),
        body: GetBuilder<NavigationController>(
            builder: (_) =>
                _widgetOptions.elementAt(navigationController.selectedIndex)),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GetBuilder<NavigationController>(
                builder: (_) => GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: AppColor.primaryColor,
                  tabActiveBorder: Border.all(color: Colors.black54, width: 1),
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: AppColor.primaryColor.withOpacity(0.1),
                  color: Colors.black,
                  tabs: const [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Beranda',
                    ),
                    GButton(
                      icon: LineIcons.list,
                      text: 'Data Training',
                    ),
                    GButton(
                      icon: Icons.settings_outlined,
                      text: 'Pengaturan',
                    ),
                    GButton(
                      icon: LineIcons.infoCircle,
                      text: 'Tentang',
                    ),
                  ],
                  selectedIndex: navigationController.selectedIndex,
                  onTabChange: (index) {
                    navigationController.updateSelectedIndex(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
