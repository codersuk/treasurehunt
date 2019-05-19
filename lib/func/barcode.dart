import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';

class BarCodeScanner {
  // ignore: non_constant_identifier_names



  Future<String> Scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      return barcode;
    } catch(e) {
      return "No barcode";
    }
  }

  Future<String> get barCode async{
    String s = await Scan();
    return s;
  }


}
