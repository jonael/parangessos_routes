import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey[900],
    primaryColor: Colors.black,
    highlightColor: Color.fromRGBO(255, 255, 255, 0.1),
    backgroundColor: Colors.blue[200],
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.pink[900]),
      headline2: TextStyle(color: Colors.pink[200]),
      headline3: TextStyle(color: Colors.pink),
      headline4: TextStyle(color: Colors.pink),
      headline5: TextStyle(color: Colors.pink),
      headline6: TextStyle(color: Colors.pink),
      subtitle1: TextStyle(color: Colors.pink),
      subtitle2: TextStyle(color: Colors.pink),
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.cyan),
      overline: TextStyle(color: Colors.pink[200]),
    ),
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.pink.shade700),
    hoverColor: Colors.blue,
    dividerColor: Colors.pink[800],
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[100],
    primaryColor: Colors.white,
    highlightColor: Color.fromRGBO(0, 0, 0, 0.1),
    backgroundColor: Colors.blue[800],
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.blue[900]),
      headline2: TextStyle(color: Colors.blue[700]),
      headline3: TextStyle(color: Colors.blue),
      headline4: TextStyle(color: Colors.blue),
      headline5: TextStyle(color: Colors.blue),
      headline6: TextStyle(color: Colors.blue),
      subtitle1: TextStyle(color: Colors.blue),
      subtitle2: TextStyle(color: Colors.blue),
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.purple[300]),
      overline: TextStyle(color: Colors.blue[50]),
    ),
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.pink.shade400),
    hoverColor: Colors.blue[200],
    dividerColor: Colors.pinkAccent,
  );
}