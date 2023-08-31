import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';


class OcrScreen extends StatefulWidget {
  const OcrScreen({super.key});

  @override
  State<OcrScreen> createState() => _OcrScreenState();
}

class _OcrScreenState extends State<OcrScreen> {
  final int _ocrCamera = FlutterMobileVision.CAMERA_BACK;
  String _text = "TEXT";
  Future<void> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _ocrCamera,
        waitTap: true,
      );
      setState(() {
        _text = texts[0].value;
      });
      log(_text);
    } on Exception {
      texts.add(OcrText('Failed to recognize text'));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _read,
          child: const Text(
            'Scanning',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
