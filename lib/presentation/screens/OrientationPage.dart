import 'package:digital_maire/core/widgets/ChoiceButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class OrientationPage extends StatelessWidget {
  const OrientationPage({super.key});

  Future<void> _scanBarcode(BuildContext context) async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Annuler',
      true,
      ScanMode.BARCODE,
    );

    if (barcode != '-1') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Code scanné: $barcode')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Scan annulé')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Veuillez choisir votre choix d'enregistrement",
              style: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ChoiceButton(
                  iconAsset: "lib/assets/w.svg",
                  text: "Manuel",
                  route: '/register',
                ),
                const SizedBox(width: 20),
                ChoiceButton(
                  iconAsset: 'lib/assets/scann.svg',
                  text: "Scanner",
                  onTap: () => _scanBarcode(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
