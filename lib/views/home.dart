import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parangessos_routes/utils/constants.dart';
import 'package:parangessos_routes/utils/header.dart';
import 'package:parangessos_routes/utils/navigation_drawer.dart';
import 'package:parangessos_routes/utils/text_sytle.dart';
import 'package:universal_platform/universal_platform.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> menu = listMenuVisitor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (UniversalPlatform.isIOS){
      return new CupertinoPageScaffold(
          navigationBar: new CupertinoNavigationBar(
            leading: new GestureDetector(
              onTap: (){

              },
              child: new Icon(
                CupertinoIcons.bars,
              ),
            ),
            middle: new DefaultTextStyle(
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              child: new Text(widget.title),
            ),
          ),
          child: body()
      );
    } else {
      return new Scaffold(
          drawer: NavigationDrawerWidget(title: widget.title,),
          appBar: new AppBar(
            centerTitle: true,
            title: new Text(
              widget.title,
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: body()
      );
    }
  }

  Widget body() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: size.height * 0.01),
          Header(size: size),
          SizedBox(height: size.height * 0.05),
          HomeTextsStyle().homeTextsSubTitle(
            "Présentation",
            18.0,
            FontWeight.bold,
          ),
          SizedBox(height: size.height * 0.01),
          HomeTextsStyle().homeTextsText(
            "Dans notre vie actuelle, il existe encore beaucoup de tabous qui, aussi tristes ou durs qu'ils soient, ne sont pas suffisamment abordés. C'est ainsi que nous avons eu l'initiative de créer ce site sur le deuil périnatal qui sera également disponible en application android.",
            Colors.black,15.0,
          ),
          SizedBox(height: size.height * 0.02),
          HomeTextsStyle().homeTextsSubTitle(
            "Quel est notre objectif ?",
            18.0,
            FontWeight.bold,
          ),
          SizedBox(height: size.height * 0.01),
          HomeTextsStyle().homeTextsText(
            "Afin de pouvoir palier à ce manque, nous avons eu l'initiative de créer un site web et application mobile. Ces supports intégreront des articles, un forum avec un tchat public et un bouton 'alerte'. Dans la page des articles, vous pourrez suivre les avancées médicales sur le deuil périnatal et les différents éléments à savoir sur le sujet. Dans la page de forum, vous aurez la possibilité de poser des questions, de parler d'un sujet qui vous tient à coeur et même de participer à un tchat publique. De plus ce forum intégrera des liens vers des ressources utiles comme des coordonnées de personnes du milieu médical qui peuvent vous aider et des pages internet d'autres sites traitant de notre sujet.",
            Colors.black,
            15.0,
          ),
          SizedBox(height: size.height * 0.03)
        ],
      ),
    );
  }
}