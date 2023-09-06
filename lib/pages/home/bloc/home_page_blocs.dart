import 'package:flutter_app/pages/home/bloc/home_page_events.dart';
import 'package:flutter_app/pages/home/bloc/home_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBlocs extends Bloc<HomePageEvents,HomePageState>{
   HomePageBlocs():super(const HomePageState()){
     on<HomePageDots>(_homePageDots);
   }

   void _homePageDots(HomePageDots event,Emitter<HomePageState>emit){
     emit(state.copyWith(index:event.index));
   }
}