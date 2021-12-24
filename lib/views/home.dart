import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:par_anges_sos/utils/constants.dart';
import 'package:par_anges_sos/utils/header.dart';
import 'package:par_anges_sos/utils/my_animation.dart';
import 'package:par_anges_sos/utils/navigation_drawer.dart';
import 'package:par_anges_sos/utils/text_sytle.dart';
import 'package:universal_platform/universal_platform.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  List<String> menu = listMenuVisitor;
  var _lineDirection = LineDirection.Ttb;
  int _lineCount = 50;

  @override
  Widget build(BuildContext context) {
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
            child: body(context)
        );
      } else {
        return new Scaffold(
            drawer: NavigationDrawerWidget(title: widget.title, context: context),
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
            body: body(context),
        );
      }
    }


  Widget body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBackground(
      behaviour: RainBehaviour(
        color: Theme.of(context).highlightColor,
        direction: _lineDirection,
        numLines: _lineCount,
      ),
      vsync: this,
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 5.0, left: 40.0, right: 40.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.01),
                Header(size: size, color: Theme.of(context).textTheme.headline1!.color!),
                SizedBox(height: size.height * 0.05),
                HomeTextsStyle().homeTextsSubTitle(
                  "Présentation",
                  18.0,
                  FontWeight.bold,
                  Theme.of(context).textTheme.headline2!.color,
                ),
                SizedBox(height: size.height * 0.03),
                HomeTextsStyle().homeTextsText(
                  "Dans notre vie actuelle, il existe encore beaucoup de tabous qui, aussi tristes ou durs qu'ils soient, ne sont pas suffisamment abordés. C'est ainsi que nous avons eu l'initiative de créer ce site sur le deuil périnatal qui sera également disponible en application android.",
                  15.0,
                  Theme.of(context).textTheme.bodyText1!.color,
                ),
                SizedBox(height: size.height * 0.05),
                HomeTextsStyle().homeTextsSubTitle(
                  "Quel est notre objectif ?",
                  18.0,
                  FontWeight.bold,
                  Theme.of(context).textTheme.headline2!.color,
                ),
                SizedBox(height: size.height * 0.03),
                HomeTextsStyle().homeTextsText(
                  "Afin de pouvoir palier à ce manque, nous avons eu l'initiative de créer un site web et application mobile. Ces supports intégreront des articles, un forum et un bouton 'alerte'. Dans la page des articles, vous pourrez suivre les avancées médicales sur le deuil périnatal et les différents éléments à savoir sur le sujet. Dans la page de forum, vous aurez la possibilité de poser des questions ou de parler d'un sujet qui vous tient à coeur. De plus ce forum intégrera des liens vers des ressources utiles comme des coordonnées de personnes du milieu médical qui peuvent vous aider et des pages internet d'autres sites traitant de notre sujet.",
                  15.0,
                  Theme.of(context).textTheme.bodyText1!.color,
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
          DraggableFab(
            child: FloatingActionButton(
              onPressed: (){print('clic');},
              child: Icon(Icons.warning),
            ),
          ),
        ],
      ),
    );
  }
}