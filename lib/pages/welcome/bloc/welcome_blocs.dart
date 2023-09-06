import 'package:flutter_app/pages/welcome/bloc/welcome_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'welcome_states.dart';


class WelcomeBlocs extends Bloc<WelcomeEvents,WelcomeState>{
  WelcomeBlocs():super(WelcomeState()){
    print("Welcome Bloc");
    on<WelcomeEvents>((event, emit){
        emit(WelcomeState(page:state.page));
    });
  }
}