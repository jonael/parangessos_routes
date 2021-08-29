import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parangessos_routes/views/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(ProviderScope(child: MyApp(savedThemeMode: savedThemeMode)));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp ({Key? key, this.savedThemeMode}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue[900],
        scaffoldBackgroundColor: Colors.white,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.pink[100],
        scaffoldBackgroundColor: Colors.grey[850],
        iconTheme: const IconThemeData(
        color: Colors.red,
        ),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, dark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Par'Anges S.O.S",
          initialRoute: '/',
          routes: {
            /* main */
            '/': (context) => HomePage(title: 'Accueil',),

            /* login, register and profil
            '/login': (context) => LoginOrRegisterPage(title: 'Login'),
            '/register': (context) => LoginOrRegisterPage(title: 'Register'),
            '/profil': (context) => ProfilPage(title: 'Profil'),
            '/modifyProfil': (context) => ModifyPage(title: 'Modify profil'),
            '/chooseTown': (context) => ChooseTownPage(title: 'Choose your town'),
            '/updateProfil': (context) => UpdateProfilPage(title: 'Update profil'),
            '/resetPassword': (context) => ResetPassPage(title: 'Reset your password'),
            '/changePassword': (context) => ChangePassPage(title: 'Change your password'),
            '/changeMail': (context) => ChangeMailPage(title: 'Change your mail'),

            /* alerts */
            '/alerts': (context) => AlertsPage(title: 'alerts'),

            /* forum */
            '/forum': (context) => ForumPage(title: 'Forum'),
            '/categorie': (context) => CatPage(title: 'Categorie'),
            '/post': (context) => PostPage(title: 'Post'),
            '/createPost': (context) => CreatePostPage(title: 'Create a post'),
            '/answerPost': (context) => AnswerPostPage(title: 'Answer post'),

            /* articles */
            '/articles': (context) => ArticlesPage(title: 'Our articles'),
            '/article': (context) => ArticlePage(title: 'Article'),
            '/createArticle': (context) => CreateArtPage(title: 'Create a article'),
            '/commentArticle': (context) => CommentArtPage(title: 'Comment this article'),*/
          },
        );
      },
    );
  }
}

