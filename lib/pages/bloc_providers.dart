import 'package:flutter_app/pages/signin/bloc/signin_blocs.dart';
import 'package:flutter_app/pages/signup/bloc/signup_bloc.dart';
import 'package:flutter_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBlocs()),
        BlocProvider(create: (context) => SignInBlocs()),
        BlocProvider(create: (context) => SignUpBlocs())
      ];
}
