import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  final String pseudo;
  final String urlImage;

  const ShowImage({
    Key? key,
    required this.pseudo,
    required this.urlImage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pseudo),
        centerTitle: true,
      ),
      body: Image.network(
        urlImage,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}