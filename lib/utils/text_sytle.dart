import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class HomeTextsStyle {
  Widget homeTextsSubTitle(data, fontSize, fontWeight) {
    if (UniversalPlatform.isIOS) {
      return new DefaultTextStyle(
          style: new TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
          child: new Text(data));
    } else {
      return new Text(
        data,
        style: new TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      );
    }
  }

  Widget homeTextsText(data, color, fontSize) {
    if (UniversalPlatform.isIOS) {
      return new DefaultTextStyle(
          style: new TextStyle(
            color: color,
            fontSize: fontSize,
          ),
          child: new Text(data));
    } else {
      return new Text(
        data,
        style: new TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      );
    }
  }
}