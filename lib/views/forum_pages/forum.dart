import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parangessos_routes/utils/navigation_drawer.dart';

class ForumPage extends StatelessWidget {
  ForumPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(title: title,),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
    );
  }
}