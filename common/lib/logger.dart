import 'package:flutter/foundation.dart';

class Logger{
  static void D(dynamic message,{String tag = "LOG"}){
    if(kDebugMode){
      print("$tag : $message");
    }
  }
}