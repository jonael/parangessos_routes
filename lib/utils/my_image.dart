import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;

class MyImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String imageUrl = "image_url";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
          (int _) => ImageElement()..src = imageUrl,
    );
    return HtmlElementView(
      viewType: imageUrl,
    );
  }
}