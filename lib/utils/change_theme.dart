import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:par_anges_sos/provider/my_themes.dart';
import 'package:provider/provider.dart';

class ChangeSwitchTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
          print(value);
        },
    );
  }

}