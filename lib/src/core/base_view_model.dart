import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier{
  bool _busy = false; // to hold two states of submit button click
  // if true displays circular progress indicator
  bool get busy => _busy; // getter since private variable, returns _busy

  //setter to set values
  void  setBusy(bool val){
    _busy = val;
    notifyListeners();
  }
}