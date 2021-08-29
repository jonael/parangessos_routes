import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        image(size),
        SizedBox(height: size.height * 0.02),
        text(),
      ],
    );
  }
  Widget image(Size size) {
    return Image.asset(
      "assets/images/logo_ailes_1080.png",
      width: size.width * 0.8,
    );
  }
  Widget text() {
    if (UniversalPlatform.isIOS){
      return new DefaultTextStyle(
          style: new TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          child: new Text("Quand le rêve devient tragédie"));
    } else {
      return Text(
        "Quand le rêve devient tragédie",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
        ),
      );
    }
  }
}