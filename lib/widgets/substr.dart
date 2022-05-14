import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget substr(label, data) => Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: Get.width / 3,
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Text(
                data.toString().substring(
                      0,
                      (data.toString().length > 5 ? 5 : data.toString().length),
                    ),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
