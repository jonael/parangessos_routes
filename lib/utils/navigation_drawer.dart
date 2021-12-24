import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:parangessos_routes/models/profil/user.dart';
import 'package:parangessos_routes/provider/my_themes.dart';
import 'package:parangessos_routes/provider/router.dart';
import 'package:parangessos_routes/utils/constants.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'change_theme.dart';


class NavigationDrawerWidget extends StatefulWidget {
  NavigationDrawerWidget({Key? key, required this.title, required this.context}) : super(key: key);
  final String title;
  final BuildContext context;

  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}
class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget>{

  final padding = EdgeInsets.symmetric(horizontal: 20);
  User? user;
  bool isEnabled = true;
  bool isChecked = false;
  var image;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    user = userLog;
    String pseudo;
    String urlImage;
    if (Provider.of<ThemeProvider>(context).isDarkMode){
      isChecked = true;
    } else {
      isChecked = false;
    }
    if (user == null){
      pseudo = 'Visitor';
      urlImage = 'assets/images/logo_ailes_1080.png';
    } else {
      if (user!.pseudo.isNotEmpty){
        pseudo = user!.pseudo;
      } else {
        pseudo = 'Visitor';
      }
      if (user!.photoUrl != null || user!.photoUrl!.isNotEmpty) {
        urlImage = user!.photoUrl!;
      } else {
        urlImage = "assets/images/logo_ailes_1080.png";
      }
    }
    return Drawer(
      child: Material(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          children: <Widget>[
            buildHeader(
              size: size,
              urlImage: urlImage,
              pseudo: pseudo,
              onClicked: () => context.router.push(LoginRoute(title: 'Se connecter', key: widget.key, context: widget.context)),
            ),
            Container(
              padding:  padding,
              child: Divider(
                color: Theme.of(context).dividerColor,
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
                      onClicked: () => selectedItem(widget.context, 0),
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
                      onClicked: () => selectedItem(widget.context, 1),
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
                      onClicked: () => selectedItem(widget.context, 2),
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
                      onClicked: () => selectedItem(widget.context, 3),
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
                      onClicked: () => selectedItem(widget.context, 4),
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
                      onClicked: () => selectedItem(widget.context, 5),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Divider(
                    color: Theme.of(context).dividerColor,
                  ),
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
                      onClicked: () => selectedItem(widget.context, 6),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  buildMenuItem(
                    text: 'Settings',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(widget.context, 7),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Switch to Dark/light Mode',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: ChangeSwitchTheme(),
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
            child: Icon(
              Icons.edit,
              color: Theme.of(context).iconTheme.color,
            ),
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
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
      ),
      title: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
          ),
      ),
      hoverColor: Theme.of(context).hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        context.router.push(LoginRoute(title: 'Se connecter', key: widget.key, context: widget.context));
        break;
      case 1:
        context.router.push(RegisterRoute(title: 'Créer un compte', key: widget.key, context: widget.context));
        break;
      case 2:
        context.router.push(HomeRoute(title: 'Accueil', key: widget.key));
        break;
      case 3:
        context.router.push(ArticlesRoute(title: 'Articles', key: widget.key));
        break;
      case 4:
        context.router.push(ForumRoute(title: 'Forum', key: widget.key));
        break;
      case 5:
        context.router.push(ResourcesRoute(title: 'Ressources utiles', key: widget.key));
        break;
      case 6:
        userLog = null;
        context.router.push(HomeRoute(title: 'Accueil', key: widget.key));
        break;
      default :
        context.router.push(HomeRoute(title: 'Accueil', key: widget.key));
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

