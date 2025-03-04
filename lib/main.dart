/// Flutter code sample for TextButton

// This sample shows how to render a disabled TextButton, an enabled TextButton
// and lastly a TextButton with gradient background.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  
  const MyStatelessWidget({Key? key}) : super(key: key);
  static final PRINTER_PLATFORM_SPECIFIC_CODE = "com.shine.business/print_wizar_pos";
  static var platform = MethodChannel(PRINTER_PLATFORM_SPECIFIC_CODE);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                   // primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    _printWizarPOS("Bonsoir maitre");
                  },
                  child: const Text('Appuyez pour imprimer'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _printWizarPOS(String value) async {
    try {
      await platform.invokeMethod('printWizarPOS', value);
    } on PlatformException catch (e) {
      print("Failed to Print with Wizar POS : $e");
    }
  }
}

