import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:par_anges_sos/controllers/api.dart';
import 'package:par_anges_sos/utils/constants.dart';
import 'package:par_anges_sos/utils/navigation_drawer.dart';
import '../home.dart';
import 'create_account.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final pseudoController = TextEditingController();
  final passwordController = TextEditingController();
  bool visible = false;
  bool visibleError = false;

  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(title: widget.title),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  Widget body() {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 10.0, left : 10.0, right : 10.0),
        child: Column(
            children: <Widget> [
              SizedBox(height: size.height * 0.02),
              NeumorphicText(
                widget.title,
                style: NeumorphicStyle(
                  depth: 10,
                ),
                textStyle: NeumorphicTextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30.0
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                width:  size.width *0.70,
                child: TextFormField(
                  controller: pseudoController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Pseudo'
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                width: size.width * 0.70,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'password'
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RegisterPage(title: 'Create Account'),
                )),
                child: Text(
                  'Pas encore de compte?',
                  style: const TextStyle(
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                    fontSize: 16.0,
                  ),
                ),
              ),
              NeumorphicButton(
                margin: const EdgeInsets.all(10.0),
                onPressed: () {
                  String pseudo = pseudoController.text.toString();
                  String password = passwordController.text.toString();

                  log(pseudo, password);
                },
                style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    color: Colors.black.withOpacity(0.1),
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15))
                ),
                child: const Text(
                  "Valider",
                  style: const TextStyle(
                    fontWeight:  FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
            ]
        ),
      ),
    );
  }


  void log(String pseudo, String password) {
    print(pseudo);
    print(password);
    if(pseudo.isEmpty) {
      setState(() {
        visibleError = !visibleError;
        error = "Veuillez renseigner un pseudo";
      });
    } else if(password.isEmpty) {
      setState(() {
        visibleError = !visibleError;
        error = "Veuillez renseigner un mot de passe";
      });
    } else {
      loginApi(pseudo, password);
    }

  }

  void loginApi(String pseudo, String password) async {
    visible = !visible;
    Api.login(pseudo, password).then((response) {
      setState(() {
        if(response == true ) {
          visible = !visible;
          print('connecté');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomePage(title: 'Home');
                  }
              )
          );
        } else {
          error = errorLog;
          visible = !visible;
          visibleError = !visibleError;
        }
      });
    });
  }
}