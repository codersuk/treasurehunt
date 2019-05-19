import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';

class BarCodeScanner {
  // ignore: non_constant_identifier_names
  String ScannedCode;


  Future<String> Scan() async {
    try {
      String barcode = await BarcodeScanner.scan();

      return barcode;
    } on PlatformException catch (e) {
      String this.ScannedCode = "error";
      return "Error";
    } on FormatException {
      return "No barcode";
    }
  }

  Future<String> get Barcode() async {
    String barC = await Scan();
    this.ScannedCode = barC;

    return barC;
  }


}
