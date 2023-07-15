

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:io';

import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class HomeScreeViewModel {

  void uploadImage1(File _image) async {

    // open a byteStream
    var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));
    // get file length
    var length = await _image.length();

    // string to uri
    var uri = Uri.parse("enter here upload URL");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // if you need more parameters to parse, add those like this. i added "user_id". here this "user_id" is a key of the API request
    request.fields["user_id"] = "text";
    String fileName = _image!.path.split('/').last;

    // multipart that takes file.. here this "image_file" is a key of the API request
    var multipartFile = new http.MultipartFile('_image', stream, length, filename: fileName);

    // add file to multipart
    request.files.add(multipartFile);

    // send request to upload image
    await request.send().then((response) async {
      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

    }).catchError((e) {
      print(e);
    });
  }




  static String Trimstring(string) {
   if (string == null) {
     return "";
   }
    if (string.length < 16) {
      return string;
    } else {
      String text = string.substring(0, 16) + '.';
      return text;
    }
  }

 static List<Map<String, dynamic>> historyItems = [
   {
     "issuer": "ID ventures",
     "account": "2467 4534 4532 6654",
     "amount": "2500,000.00",
   },
   {
     "issuer": "Greory Aidoo Richardson",
     "account": "2467 4534 4532 6654",
     "amount": "1,025.00",
   },
   {
     "issuer": "Yestech Ghana Incorporated",
     "account": "2467 4534 4532 6654",
     "amount": "1,800,025.00",
   },
   {
     "issuer": "Yestech Ghana Incorporated",
     "account": "2467 4534 4532 6654",
     "amount": "1,800,025.00",
   },
   {
     "issuer": "Yestech Ghana Incorporated",
     "account": "2467 4534 4532 6654",
     "amount": "1,800,025.00",
   },
 ];


}


