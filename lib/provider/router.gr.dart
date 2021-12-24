// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: HomePage(key: args.key, title: args.title));
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: LoginPage(key: args.key, title: args.title));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: RegisterPage(key: args.key, title: args.title));
    },
    ProfilRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ProfilPage(
              key: args.key,
              title: args.title,
              pseudo: args.pseudo,
              urlImage: args.urlImage));
    },
    ForumRoute.name: (routeData) {
      final args = routeData.argsAs<ForumRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ForumPage(key: args.key, title: args.title));
    },
    ArticlesRoute.name: (routeData) {
      final args = routeData.argsAs<ArticlesRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ArticlesPage(key: args.key, title: args.title));
    },
    ResourcesRoute.name: (routeData) {
      final args = routeData.argsAs<ResourcesRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ResourcesPage(key: args.key, title: args.title));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(LoginRoute.name, path: '/login-page'),
        RouteConfig(RegisterRoute.name, path: '/register-page'),
        RouteConfig(ProfilRoute.name, path: '/profil-page'),
        RouteConfig(ForumRoute.name, path: '/forum-page'),
        RouteConfig(ArticlesRoute.name, path: '/articles-page'),
        RouteConfig(ResourcesRoute.name, path: '/resources-page')
      ];
}

/// generated route for [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({Key? key, required String title})
      : super(name, path: '/', args: HomeRouteArgs(key: key, title: title));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({Key? key, required String title, required BuildContext context})
      : super(name,
            path: '/login-page', args: LoginRouteArgs(key: key, title: title, context: context));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.title, required this.context});

  final Key? key;
  final BuildContext context;
  final String title;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for [RegisterPage]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({Key? key, required String title, required BuildContext context})
      : super(name,
            path: '/register-page',
            args: RegisterRouteArgs(key: key, title: title, context: context));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.title, required this.context});

  final Key? key;
  final BuildContext context;
  final String title;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for [ProfilPage]
class ProfilRoute extends PageRouteInfo<ProfilRouteArgs> {
  ProfilRoute(
      {Key? key,
      required String title,
      required String pseudo,
      required String urlImage})
      : super(name,
            path: '/profil-page',
            args: ProfilRouteArgs(
                key: key, title: title, pseudo: pseudo, urlImage: urlImage));

  static const String name = 'ProfilRoute';
}

class ProfilRouteArgs {
  const ProfilRouteArgs(
      {this.key,
      required this.title,
      required this.pseudo,
      required this.urlImage});

  final Key? key;

  final String title;

  final String pseudo;

  final String urlImage;

  @override
  String toString() {
    return 'ProfilRouteArgs{key: $key, title: $title, pseudo: $pseudo, urlImage: $urlImage}';
  }
}

/// generated route for [ForumPage]
class ForumRoute extends PageRouteInfo<ForumRouteArgs> {
  ForumRoute({Key? key, required String title})
      : super(name,
            path: '/forum-page', args: ForumRouteArgs(key: key, title: title));

  static const String name = 'ForumRoute';
}

class ForumRouteArgs {
  const ForumRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'ForumRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for [ArticlesPage]
class ArticlesRoute extends PageRouteInfo<ArticlesRouteArgs> {
  ArticlesRoute({Key? key, required String title})
      : super(name,
            path: '/articles-page',
            args: ArticlesRouteArgs(key: key, title: title));

  static const String name = 'ArticlesRoute';
}

class ArticlesRouteArgs {
  const ArticlesRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'ArticlesRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for [ResourcesPage]
class ResourcesRoute extends PageRouteInfo<ResourcesRouteArgs> {
  ResourcesRoute({Key? key, required String title})
      : super(name,
            path: '/resources-page',
            args: ResourcesRouteArgs(key: key, title: title));

  static const String name = 'ResourcesRoute';
}

class ResourcesRouteArgs {
  const ResourcesRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'ResourcesRouteArgs{key: $key, title: $title}';
  }
}
