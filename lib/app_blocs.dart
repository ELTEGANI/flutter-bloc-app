import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_states.dart';
import 'app_events.dart';

class AppBloc extends Bloc<AppEvents,AppStates>{
   AppBloc():super(InitStates()){
     print("App Bloc");
     on<Increment>((event,emit){
       emit(AppStates(counter: state.counter+1));
     });
     on<Decrement>((event,emit){
       emit(AppStates(counter: state.counter-1));
     });
   }
}