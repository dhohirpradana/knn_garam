import 'package:flutter/material.dart';

Widget substr(label, data) => Text(
      label +
          data.toString().substring(
                0,
                (data.toString().length > 5 ? 5 : data.toString().length),
              ),
    );
