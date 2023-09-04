import 'package:flutter/material.dart';
import 'package:flutter_app/common/routes/routes.dart';
import 'package:flutter_app/pages/signin/bloc/signin_blocs.dart';
import 'package:flutter_app/pages/signin/sign_in.dart';
import 'package:flutter_app/pages/signup/bloc/signup_bloc.dart';
import 'package:flutter_app/pages/signup/sign_up.dart';
import 'package:flutter_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_app/pages/welcome/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          route: AppRoutes.SIGNIN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          route: AppRoutes.SIGNUP,
          page: const SignUp(),
          bloc: BlocProvider(create: (_) => SignUpBloc())),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext buildContext) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings routeSettings) {
    if (routeSettings.name != null) {
      var result =
          routes().where((element) => element.route == routeSettings.name);
      if (result.isNotEmpty) {
        print("valid route name ${routeSettings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: routeSettings);
      }
    }
    print("invalid route name ${routeSettings.name}");
    return MaterialPageRoute(builder: (_) => SignIn(), settings: routeSettings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
