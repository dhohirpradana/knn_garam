import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore_for_file: prefer_const_constructors_in_immutables
class ImageDetailPage extends StatelessWidget {
  final String imageData;
  ImageDetailPage({Key? key, required this.imageData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: Image.asset(
            imageData,
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
