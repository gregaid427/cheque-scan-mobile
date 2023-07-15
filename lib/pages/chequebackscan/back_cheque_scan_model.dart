import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class BackscanModel {

 var myarr = [];
  void frontimage(String imageFile1) {
    imageFile1 = imageFile1;
    print('front image set');
    print(imageFile1);

  }

  Future<void> uploadImage() async {
    print("im caled oooo");



     String fileName = myarr[0].split('/').last;
     String fileName2 = myarr[1].split('/').last;
    print('111233243424342342434');
    print(myarr[0]);
    print(myarr[1]);

    print('dfsdfsdfgdfhfghgfhjhgjg');

    MultipartFile? multipartFile, multipartFile1;


    multipartFile =
        await MultipartFile.fromFile(myarr[0].toString(), filename: myarr[0].split('/').last);
    multipartFile1 =
        await MultipartFile.fromFile(myarr[1].toString(), filename: myarr[1].split('/').last);

    var dio = Dio();
    FormData data = FormData.fromMap({
      'file': [multipartFile, multipartFile1],
      "scanImageBack": fileName,
      "scanImageFront": fileName,
      "scanAccntNo": "292547234753945345-34",
      "scanBankNo": "292547234753945345-34",
      "scanChequeNo": "1"
    });

    var response = await dio.post('http://192.168.43.53:5000/api/scan/upload',
        data: data, onSendProgress: (int sent, int total) {
      print('$sent $total');
    });
    print(response.data);

  }
}
