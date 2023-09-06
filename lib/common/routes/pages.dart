import 'package:flutter/material.dart';
import 'package:flutter_app/common/routes/routes.dart';
import 'package:flutter_app/global/global.dart';
import 'package:flutter_app/pages/dashboard/bloc/dashboard_blocs.dart';
import 'package:flutter_app/pages/home/bloc/home_page_blocs.dart';
import 'package:flutter_app/pages/home/home_page.dart';
import 'package:flutter_app/pages/signin/bloc/signin_blocs.dart';
import 'package:flutter_app/pages/signin/sign_in.dart';
import 'package:flutter_app/pages/signup/bloc/signup_bloc.dart';
import 'package:flutter_app/pages/signup/sign_up.dart';
import 'package:flutter_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_app/pages/welcome/welcome_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/dashboard/dashboard.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBlocs())),
      PageEntity(
          route: AppRoutes.SIGNIN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBlocs())),
      PageEntity(
          route: AppRoutes.SIGNUP,
          page: const SignUp(),
          bloc: BlocProvider(create: (_) => SignUpBlocs())),
      PageEntity(
          route: AppRoutes.DASHBOARD,
          page: const DashBoardPage(),
          bloc: BlocProvider(create: (_) => DashboardBlocs())
      ),
      PageEntity(
          route: AppRoutes.HomePage,
          page: const HomePage(),
          bloc: BlocProvider(create: (_) => HomePageBlocs())
      )
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
        bool deviceFirstOpen = Global.storageServices.getDeviceFirstOpen();
        if(result.first.route==AppRoutes.INITIAL&&deviceFirstOpen){
          bool isLoggedIn = Global.storageServices.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_)=>const DashBoardPage(),settings:routeSettings);
          }
           return MaterialPageRoute(builder: (_)=>const SignIn(),settings:routeSettings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: routeSettings);
      }
    }
    print("invalid route name ${routeSettings.name}");
    return MaterialPageRoute(builder: (_) => const SignIn(), settings: routeSettings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
