import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:par_anges_sos/utils/navigation_drawer.dart';
import 'package:universal_platform/universal_platform.dart';

class ProfilPage extends StatefulWidget {
  ProfilPage({
    Key? key,
    required this.title,
    required this.pseudo,
    required this.urlImage
  }) : super(key: key);

  final String pseudo;
  final String urlImage;
  final String title;

  @override
  _ProfilPageState createState() => new _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage>{

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isEnabled1 = true;
  bool isEnabled2 = true;
  bool isEnabled3 = true;
  bool isEnabled4 = true;
  bool isEnabled5 = true;
  bool isEnabled6 = true;
  bool isEnabled7 = true;

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
          Center(
            child: Container(
              width: size.width * 0.5,
              child: Image.network(
                widget.urlImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
          Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Voulez vous être volontaire ?',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: NeumorphicSwitch(
                      style: NeumorphicSwitchStyle(
                        lightSource: LightSource.topLeft,
                        trackDepth: 20,
                        thumbShape: NeumorphicShape.concave,
                        activeThumbColor: Colors.pinkAccent,
                        inactiveThumbColor: Colors.blueGrey,
                      ),
                      duration: Duration(milliseconds: 400),
                      isEnabled: isEnabled1,
                      value: isChecked1,
                      onChanged:  (value) {
                        setState(() {
                          isChecked1 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Activer notifications par e-mail',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: NeumorphicSwitch(
                      style: NeumorphicSwitchStyle(
                        lightSource: LightSource.topLeft,
                        trackDepth: 20,
                        thumbShape: NeumorphicShape.concave,
                        activeThumbColor: Colors.pinkAccent,
                        inactiveThumbColor: Colors.blueGrey,
                      ),
                      duration: Duration(milliseconds: 400),
                      isEnabled: isEnabled2,
                      value: isChecked2,
                      onChanged:  (value) {
                        setState(() {
                          isChecked2 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Activer notifications par sms',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: NeumorphicSwitch(
                      style: NeumorphicSwitchStyle(
                        lightSource: LightSource.topLeft,
                        trackDepth: 20,
                        thumbShape: NeumorphicShape.concave,
                        activeThumbColor: Colors.pinkAccent,
                        inactiveThumbColor: Colors.blueGrey,
                      ),
                      duration: Duration(milliseconds: 400),
                      isEnabled: isEnabled3,
                      value: isChecked3,
                      onChanged:  (value) {
                        setState(() {
                          isChecked3 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Activer notifications par icone et/ou son',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: NeumorphicSwitch(
                      style: NeumorphicSwitchStyle(
                        lightSource: LightSource.topLeft,
                        trackDepth: 20,
                        thumbShape: NeumorphicShape.concave,
                        activeThumbColor: Colors.pinkAccent,
                        inactiveThumbColor: Colors.blueGrey,
                      ),
                      duration: Duration(milliseconds: 400),
                      isEnabled: isEnabled4,
                      value: isChecked4,
                      onChanged:  (value) {
                        setState(() {
                          isChecked4 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Activer notifications par appel',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: NeumorphicSwitch(
                      style: NeumorphicSwitchStyle(
                        lightSource: LightSource.topLeft,
                        trackDepth: 20,
                        thumbShape: NeumorphicShape.concave,
                        activeThumbColor: Colors.pinkAccent,
                        inactiveThumbColor: Colors.blueGrey,
                      ),
                      duration: Duration(milliseconds: 400),
                      isEnabled: isEnabled5,
                      value: isChecked5,
                      onChanged:  (value) {
                        setState(() {
                          isChecked5 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Partager mes informations ?',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: NeumorphicSwitch(
                      style: NeumorphicSwitchStyle(
                        lightSource: LightSource.topLeft,
                        trackDepth: 20,
                        thumbShape: NeumorphicShape.concave,
                        activeThumbColor: Colors.pinkAccent,
                        inactiveThumbColor: Colors.blueGrey,
                      ),
                      duration: Duration(milliseconds: 400),
                      isEnabled: isEnabled6,
                      value: isChecked6,
                      onChanged:  (value) {
                        setState(() {
                          isChecked6 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
            ],
          ),
          SizedBox(height: size.height * 0.03)
        ],
      ),
    );
  }
}