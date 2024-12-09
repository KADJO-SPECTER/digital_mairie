import 'package:digital_maire/core/widgets/ChoiceButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  String _scannedBarcode = '';

  Future<void> _scanBarcode() async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Annuler',
      true,
      ScanMode.BARCODE,
    );

    if (barcode != '-1') {
      setState(() {
        _scannedBarcode = barcode;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Code scanné: $_scannedBarcode')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Scan annulé')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanner de codes-barres')),
      body: Center(
        child: Column(
          children: [
            Text(
              "Veuillez choisir votre choix d'enregistrement",
              style: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceButton(
                  iconAsset: 'lib/assets/w.svg',
                  text: 'Manuel',
                  route: '/register',
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                ChoiceButton(
                  iconAsset: 'lib/assets/scann.svg',
                  text: 'Scanner',
                  onTap: _scanBarcode,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
