import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../core/provider/Transactionsdata.dart';
import '../transactions/transactions_preview_screen.dart';
import 'front_cheque_scan.dart';

class FrontChequeScanViewModel extends ChangeNotifier {

  bool textScanning = false;

  XFile? imageFile;
  bool showNext = false;
  String scannedText = "";


  void getImage(ImageSource source, BuildContext context) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        String  value = imageFile!.path;
        Provider.of<TransactionsData>(context, listen: false).setfrontImagelink(value);

        //  transactionsData.setfrontImagelink(value);
        backscanModel.frontimage(imageFile!.path);
        // backscanModel.imageFile1 = File(pickedImage!.path);
        // backscanModel.myarr.add(value);


          scanimageFile = pickedImage!.path;
          notifyListeners();

        getRecognisedText(pickedImage);
        print("pickedImage");

        print(pickedImage.name);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textDetector();
    RecognisedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }
    print(scannedText);
      textScanning = false;
      notifyListeners();
      showNext = true;
      notifyListeners();
  }









}