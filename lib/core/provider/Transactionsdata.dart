import 'package:flutter/cupertino.dart';

class TransactionsData extends ChangeNotifier {

  String? _frontImagelink;
  String? _backImagelink;
  String? _chosenAccount;
  String? _chosenAccountid;
  String? _transferType = "Express";
  String? _accountType;
  String? _bank;



  get getfrontImagelink => _frontImagelink;
  get getbackImagelink => _backImagelink;
  get getchosenAccount => _chosenAccount;
  get getchosenAccountid => _chosenAccountid;
  get getTransferType => _transferType;
  get getaccountType => _accountType;
  get getbank => _bank;



  void setbank(String link){
    _bank = link;
    notifyListeners();

  }

  void setChosenAccountType(String link){
    _accountType = link;
    notifyListeners();

  }

  void setfrontImagelink(String link){
    _frontImagelink = link;
    notifyListeners();

  }

  void setBackImagelink(String link){
    _backImagelink = link;
    notifyListeners();
  }

  void setChosenAccount(String value){
    print('account is set');
    _chosenAccount = value;
    notifyListeners();

  }

  void setChosenAccountid(String value){
    _chosenAccountid = value;
    notifyListeners();

  }

  void setTransferType(String link){
    _transferType = link;
    notifyListeners();
    print('transfer type is set to $_transferType' );
  }

  void setFieldsEmpty() {
     _frontImagelink = "";
     _backImagelink = "";
     _chosenAccount ="";
     _transferType = "Express";
     _accountType ="";
     _bank = "";

  }

}