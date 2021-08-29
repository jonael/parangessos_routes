import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class HomeTextsStyle {
  Widget homeTextsSubTitle(data, fontSize, fontWeight, Color? color) {
    if (UniversalPlatform.isIOS) {
      return new DefaultTextStyle(
          style: new TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
          child: new Text(data));
    } else {
      return new Text(
        data,
        style: new TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      );
    }
  }

  Widget homeTextsText(data, fontSize, Color? color) {
    if (UniversalPlatform.isIOS) {
      return new DefaultTextStyle(
          style: new TextStyle(
            fontSize: fontSize,
            color: color,
          ),
          child: new Text(data));
    } else {
      return new Text(
        data,
        style: new TextStyle(
          fontSize: fontSize,
          color: color,
        ),
      );
    }
  }
}