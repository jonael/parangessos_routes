import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parangessos_routes/utils/navigation_drawer.dart';

class ProfilPage extends StatelessWidget {
  ProfilPage({
    Key? key,
    required this.title,
    required this.pseudo,
    required this.urlImage
  }) : super(key: key);

  final String pseudo;
  final String urlImage;
  final String title;

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