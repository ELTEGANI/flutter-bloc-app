import 'package:flutter_app/pages/bloc/welcome_events.dart';
import 'package:flutter_app/pages/bloc/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvents,WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
    print("Welcome Bloc");
    on<WelcomeEvents>((event, emit){
        emit(WelcomeState(page:state.page));
    });
  }
}