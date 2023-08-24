import 'package:flutter/material.dart';
import 'package:flutter_app/pages/bloc/welcome_blocs.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_states.dart';
import 'app_events.dart';
import 'pages/welcome.dart';

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
          home: const Welcome(),
          routes:{
           "myHomePage":(context)=>const MyHomePage()
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
        body: Center(
          child:BlocBuilder<AppBloc,AppStates>(
            builder:(context,state){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    "${BlocProvider.of<AppBloc>(context).state.counter}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag:"heroTag1",
              onPressed:()=>BlocProvider.of<AppBloc>(context).add(Increment()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              heroTag:"HeroTag2",
              onPressed:()=>BlocProvider.of<AppBloc>(context).add(Decrement()),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

