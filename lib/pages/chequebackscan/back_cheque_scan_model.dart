
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../core/provider/Transactionsdata.dart';

class BackscanModel {

 var myarr = [];
  void frontimage(String imageFile1) {
    imageFile1 = imageFile1;
    print('front image set');
    print(imageFile1);

  }

  String? imageFront ;
  Future<int?> uploadImage({required imagefront,required imageback, required scanAccntNo, required scanBankNo, String? user_id, required String amount, required String account_id}) async {
    print("File Upload Called");
    print(imagefront);
    print(user_id);


    String? fileName1 = imagefront?.split('/').last;
    String? fileName2 = imageback?.split('/').last;
    MultipartFile? multipartFile, multipartFile1;


    multipartFile = await MultipartFile.fromFile(imagefront!, filename: fileName1);

    multipartFile1 = await MultipartFile.fromFile(imageback!, filename: fileName2);


    var dio = Dio();
    FormData data = FormData.fromMap({
      'file': [multipartFile, multipartFile1],
      "scanImageBack": fileName1,
      "scanImageFront": fileName2,
      "scanAccntNo": scanAccntNo,
      "scanBankNo": scanBankNo,
      "user": scanBankNo,
      "user_id": user_id,
      "issuer": "Issueroncheckscan",
      "amount": amount,
      "scanChequeNo": "1"
    });

    int? res = 500;
    try{
    var response = await dio.post('http://192.168.43.53:5000/api/scan/upload',
        data: data,

        onSendProgress: (int sent, int total) {
      print('$sent $total');
    });
    print(response.statusCode);
    return response.statusCode;


  } on DioError catch (e) {
 return res;
 }

  }
}
