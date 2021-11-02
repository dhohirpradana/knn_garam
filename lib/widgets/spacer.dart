import 'package:flutter/cupertino.dart';

Widget spacer({double? height, double? width}) => SizedBox(
      height: (height != null) ? height : 0,
      width: (width != null) ? width : 0,
    );
