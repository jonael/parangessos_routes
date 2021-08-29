import 'dart:html';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:parangessos_routes/models/profil/user.dart';
import 'package:parangessos_routes/utils/constants.dart';
import 'package:parangessos_routes/views/articles_pages/articles.dart';
import 'package:parangessos_routes/views/forum_pages/forum.dart';
import 'package:parangessos_routes/views/home.dart';
import 'package:parangessos_routes/views/profil_pages/create_account.dart';
import 'package:parangessos_routes/views/profil_pages/login.dart';
import 'package:parangessos_routes/views/profil_pages/show_image.dart';
import 'package:parangessos_routes/views/settings.dart';
import 'package:parangessos_routes/views/useful_resources.dart';
import 'dart:ui' as ui;

import 'package:universal_platform/universal_platform.dart';

class NavigationDrawerWidget extends StatefulWidget {
  NavigationDrawerWidget({Key? key, required this.title}) : super(key: key);
  final String title;



  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}
class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget>{

  final padding = EdgeInsets.symmetric(horizontal: 20);
  User? user;
  bool isChecked = false;
  bool isEnabled = true;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    user = userLog;
    String pseudo;
    String urlImage;
    if (user == null){
      pseudo = 'Visitor';
      urlImage = '';
    } else {
      if (user!.pseudo.isNotEmpty){
        pseudo = user!.pseudo;
      } else {
        pseudo = 'Visitor';
      }
      if (user!.photoUrl != null || user!.photoUrl!.isNotEmpty) {
        urlImage = user!.photoUrl!;
      } else {
        urlImage = "";
      }
    }
    return Drawer(
      child: Material(
        color: Color.fromRGBO(99, 164, 255, 100),
        child: ListView(
          children: <Widget>[
            buildHeader(
              size: size,
              urlImage: urlImage,
              pseudo: pseudo,
              onClicked: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShowImage(
                    pseudo: pseudo,
                    urlImage: urlImage,
                  ),
                ),
              ),
            ),
            Container(
              padding:  padding,
              child: Divider(
                color: Colors.white70,
              ),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  Visibility(
                    visible: changeVisibility1(),
                    child: SizedBox(
                      height: size.height * 0.02,
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility1(),
                    child: buildMenuItem(
                      text: 'Login',
                      icon: Icons.login,
                      onClicked: () => selectedItem(context, 0),
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility2(),
                    child: SizedBox(
                      height: size.height * 0.02,
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility2(),
                    child: buildMenuItem(
                      text: 'Create Account',
                      icon: Icons.app_registration,
                      onClicked: () => selectedItem(context, 1),
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility3(),
                    child: SizedBox(
                      height: size.height * 0.02,
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility3(),
                    child: buildMenuItem(
                      text: 'Home',
                      icon: Icons.home,
                      onClicked: () => selectedItem(context, 2),
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility4(),
                    child: SizedBox(
                      height: size.height * 0.02,
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility4(),
                    child: buildMenuItem(
                      text: 'Articles',
                      icon: Icons.article,
                      onClicked: () => selectedItem(context, 3),
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility5(),
                    child: SizedBox(
                      height: size.height * 0.02,
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility5(),
                    child: buildMenuItem(
                      text: 'Forum',
                      icon: Icons.forum,
                      onClicked: () => selectedItem(context, 4),
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility6(),
                    child: SizedBox(
                      height: size.height * 0.02,
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility6(),
                    child: buildMenuItem(
                      text: 'Useful Resources',
                      icon: Icons.list,
                      onClicked: () => selectedItem(context, 5),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Divider(color: Colors.white70,),
                  Visibility(
                    visible: changeVisibility7(),
                    child: SizedBox(
                        height: size.height * 0.02,
                    ),
                  ),
                  Visibility(
                    visible: changeVisibility7(),
                    child: buildMenuItem(
                      text: 'Log Off',
                      icon: Icons.logout,
                      onClicked: () => selectedItem(context, 6),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Switch to Dark/light Mode',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: NeumorphicSwitch(
                          style: NeumorphicSwitchStyle(
                            trackDepth: 10,
                            thumbShape: NeumorphicShape.concave,
                            activeThumbColor: Colors.green,
                            inactiveThumbColor: Colors.blueGrey,
                          ),
                          duration: Duration(milliseconds: 400),
                          isEnabled: isEnabled,
                          value: isChecked,
                          onChanged:  (value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateState() {
    setState(() {
      AdaptiveTheme.of(context).toggleThemeMode();
    });
  }




  Widget buildHeader({
    required Size size,
    required String urlImage,
    required String pseudo,
    required ui.VoidCallback onClicked,
  }) => InkWell(
    onTap: onClicked,
    child: Container(
      padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(urlImage),
          ),
          SizedBox(width: size.width * 0.01,),
          Text(pseudo),
          Spacer(),
          CircleAvatar(
            radius: 24,
            child: Icon(Icons.edit),
          ),
        ],
      ),
    ),
  );


  Widget buildMenuItem({
    required String text,
    required IconData icon,
    ui.VoidCallback? onClicked,
  }){
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
          text,
          style: TextStyle(
              color: color,
          ),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginPage(title: 'Login'),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RegisterPage(title: 'Create Account'),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(title: 'Home',),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ArticlesPage(title: 'Articles'),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ForumPage(title: 'Forum'),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResourcesPage(title: 'Useful Resources',),
        ));
        break;
      case 6:
        userLog = null;
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(title: 'Home'),
        ));
        break;
      default :
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(title: 'Home',),
        ));
        break;
    }
  }

  changeVisibility1() {
    if(widget.title != 'Login' && user == null) {
        return true;
    } else return false;
  }
  changeVisibility2() {
    if(widget.title != 'Create Account' && user == null){
      return true;
    } else return false;
  }
  changeVisibility3() {
    if(widget.title != 'Home'){
      return true;
    } else return false;
  }
  changeVisibility4() {
    if(widget.title != 'Articles' && user != null){
      return true;
    } else return false;
  }
  changeVisibility5() {
    if(widget.title != 'Forum' && user != null){
      return true;
    } else return false;
  }
  changeVisibility6() {
    if(widget.title != 'Useful Resources' && user != null){
      return true;
    } else return false;
  }
  changeVisibility7() {
    if(user != null){
      return true;
    } else return false;
  }
}

