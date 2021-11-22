import 'dart:io';
import 'package:dio/dio.dart';

Future chooch(File file) async {
  Dio dio = Dio();
  String fileName = file.path.split('/').last;
  FormData formData = FormData.fromMap({
    "image": await MultipartFile.fromFile(file.path, filename: fileName),
  });
  final response = await dio.post(
      "https://api.chooch.ai/predict/image?apikey=122a6ea4-a56e-499b-a19a-5aa49803a249&model_id=8930",
      data: formData);
  // print(response.data);
  return response.data;
}
