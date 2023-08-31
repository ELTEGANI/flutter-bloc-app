import 'package:flutter_app/pages/signup/bloc/signup_events.dart';
import 'package:flutter_app/pages/signup/bloc/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpStates>{
   SignUpBloc():super(const SignUpStates()){
     on<UserNameEvent>(_userNameEvent);
     on<EmailEvent>(_emailEvent);
     on<PasswordEvent>(_passwordEvent);
     on<RePasswordEvent>(_rePasswordEvent);
  }

   void _userNameEvent(UserNameEvent userNameEvent,Emitter<SignUpStates>emit){
      print("${userNameEvent.userName}");
      emit(state.copyWith(userName:userNameEvent.userName));
   }

   void _emailEvent(EmailEvent emailEvent,Emitter<SignUpStates>emit){
     print("${emailEvent.email}");
     emit(state.copyWith(email:emailEvent.email));
   }

   void _passwordEvent(PasswordEvent passwordEvent,Emitter<SignUpStates>emit){
     print("${passwordEvent.password}");
     emit(state.copyWith(email:passwordEvent.password));
   }

   void _rePasswordEvent(RePasswordEvent rePasswordEvent,Emitter<SignUpStates>emit){
     print("${rePasswordEvent.rePassword}");
     emit(state.copyWith(email:rePasswordEvent.rePassword));
   }
}