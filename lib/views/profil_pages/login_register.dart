import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:parangessos_routes/controllers/api.dart';
import 'package:parangessos_routes/models/profil/user.dart';
import 'package:parangessos_routes/utils/constants.dart';
import 'package:parangessos_routes/utils/navigation_drawer.dart';
import 'package:parangessos_routes/views/home.dart';

class LogOrRegPage extends StatefulWidget {
  LogOrRegPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LogOrRegPageState createState() => _LogOrRegPageState();
}

class _LogOrRegPageState extends State<LogOrRegPage> {

  final pseudoController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final mailController = TextEditingController();
  final confirmMailController = TextEditingController();

  bool choice = false;
  bool change = false;
  bool onlyForCreate = false;
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
                updateTitlePage(),
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
              Visibility(
                visible: visible,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: const CircularProgressIndicator(),
                ),
              ),
              Visibility(
                visible: onlyForCreate,
                child: SizedBox(height: size.height * 0.03),
              ),
              Visibility(
                visible: onlyForCreate,
                child: Container(
                  width: size.width * 0.70,
                  child: TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Confirm password'
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: onlyForCreate,
                  child: SizedBox(height: size.height * 0.03)),
              Visibility(
                visible: onlyForCreate,
                child: Container(
                  width: size.width * 0.70,
                  child: TextFormField(
                    controller: mailController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'E-mail'
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: onlyForCreate,
                  child: SizedBox(height: size.height * 0.03)),
              Visibility(
                visible: onlyForCreate,
                child: Container(
                  width: size.width * 0.70,
                  child: TextFormField(
                    controller: confirmMailController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'confirm your E-mail'
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Visibility(
                visible: visibleError,
                child: Container(
                  width: size.width * 0.70,
                  child: Text(
                    error,
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: updateState,
                child: Text(
                  updateChoice(),
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
                  String confirmPassword = confirmPasswordController.text.toString();
                  String mail = mailController.text.toString();
                  String confirmMail = confirmMailController.text.toString();
                  logOrReg(pseudo, password, confirmPassword, mail, confirmMail,);
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

  String updateTitlePage() {
    return (choice)? "Créer compte" : "Se connecter";
  }

  String updateChoice() {
    return (change)? "Déjà un compte?" : "Pas encore de compte";
  }

  updateState() {
    setState(() {
      choice = !choice;
      change = !change;
      onlyForCreate = !onlyForCreate;
    });
  }

  void logOrReg(String pseudo, String password, String confirmPass, String mail , String confirmMail,) {
    print(pseudo);
    print(mail);
    print(confirmMail);
    print(password);
    print(confirmPass);
    print(onlyForCreate);
    if(onlyForCreate == true) {
      if(password == confirmPass) {
        if(mail == confirmMail){
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
          } else if(confirmPass.isEmpty) {
            setState(() {
              visibleError = !visibleError;
              error = "Veuillez confirmer votre mot de passe";
            });
          } else if(mail.isEmpty) {
            setState(() {
              visibleError = !visibleError;
              error = "Veuillez renseigner un e-mail";
            });
          } else if(confirmMail.isEmpty) {
            setState(() {
              visibleError = !visibleError;
              error = "Veuillez confirmer votre e-mail";
            });
          } else {
            registerApi( pseudo, password, mail);
          }
        } else {
          setState(() {
            visibleError = !visibleError;
            error = "Les e-mails ne correspondent pas";
          });
        }
      } else {
        setState(() {
          visibleError = !visibleError;
          error = "Les mot de passes ne correspondent pas";
        });
      }
    } else {
      if(pseudo.isEmpty) {
        setState(() {
          visibleError = !visibleError;
          error = "Veuillez renseigner un login ou email";
        });
      } else if (password.isEmpty) {
        setState(() {
          visibleError = !visibleError;
          error = "Veuillez renseigner un mot de passe";
        });
      } else {
        loginApi(pseudo, password);
      }
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

  void registerApi( String pseudo, String password, String mail) async {
    visible = !visible;
    Api.register(pseudo, password, mail).then((response) {
      setState(() {
        if(response == true) {
          visible = !visible;
          print('création compte');
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