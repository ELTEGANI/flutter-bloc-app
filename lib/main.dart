import 'package:flutter/material.dart';
import 'package:flutter_app/pages/signin/sign_in.dart';
import 'package:flutter_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_states.dart';
import 'pages/welcome/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context)=>WelcomeBloc()
      ),
      BlocProvider(
        lazy:false,
          create: (context)=>AppBloc()
      )
    ],
    child:ScreenUtilInit(
        builder:(context,child)=>MaterialApp(
          theme: ThemeData(
            appBarTheme:const AppBarTheme(
              elevation:0,
              backgroundColor:Colors.white
            )
          ),
          home: const Welcome(),
          routes:{
           "myHomePage":(context)=>const MyHomePage(),
           "signIn":(context)=>const SignIn()
          },
        )
    ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Demo Home Page"),
        ),
        body: const Center(),
    );
  }
}

