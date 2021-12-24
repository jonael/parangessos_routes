import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:par_anges_sos/controllers/api.dart';
import 'package:par_anges_sos/utils/constants.dart';
import 'package:par_anges_sos/utils/navigation_drawer.dart';
import '../home.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final pseudoController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final mailController = TextEditingController();
  final confirmMailController = TextEditingController();

  bool visible = false;
  bool visibleError = false;

  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(title: widget.title, context: context,),
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
              SizedBox(height: size.height * 0.03),
              Container(
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
              SizedBox(height: size.height * 0.03),
              Container(
                width: size.width * 0.70,
                child: TextFormField(
                  controller: mailController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'E-mail'
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                width: size.width * 0.70,
                child: TextFormField(
                  controller: confirmMailController,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'confirm your E-mail'
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
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
              TextButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(title: 'Login'),
                    ),
                ),
                child: Text(
                  "J'ai déjà un compte",
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
                  reg(pseudo, password, confirmPassword, mail, confirmMail,);
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


  void reg(String pseudo, String password, String confirmPass, String mail , String confirmMail,) {
    print(pseudo);
    print(mail);
    print(confirmMail);
    print(password);
    print(confirmPass);
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