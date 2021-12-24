import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:parangessos_routes/views/articles_pages/articles.dart';
import 'package:parangessos_routes/views/forum_pages/forum.dart';
import 'package:parangessos_routes/views/home.dart';
import 'package:parangessos_routes/views/profil_pages/create_account.dart';
import 'package:parangessos_routes/views/profil_pages/login.dart';
import 'package:parangessos_routes/views/profil_pages/profil.dart';
import 'package:parangessos_routes/views/useful_resources.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage),
    AutoRoute(page: ProfilPage),
    AutoRoute(page: ForumPage),
    AutoRoute(page: ArticlesPage),
    AutoRoute(page: ResourcesPage),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}