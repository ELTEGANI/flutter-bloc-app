import 'package:flutter_app/pages/signup/bloc/signup_events.dart';
import 'package:flutter_app/pages/signup/bloc/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocs extends Bloc<SignUpEvent,SignUpStates>{
   SignUpBlocs():super(const SignUpStates()){
     on<UserNameEvent>(_userNameEvent);
     on<EmailEvent>(_emailEvent);
     on<PasswordEvent>(_passwordEvent);
     on<RePasswordEvent>(_rePasswordEvent);
  }

   void _userNameEvent(UserNameEvent userNameEvent,Emitter<SignUpStates>emit){
      emit(state.copyWith(userName:userNameEvent.userName));
   }

   void _emailEvent(EmailEvent emailEvent,Emitter<SignUpStates>emit){
     emit(state.copyWith(email:emailEvent.email));
   }

   void _passwordEvent(PasswordEvent passwordEvent,Emitter<SignUpStates>emit){
     emit(state.copyWith(password:passwordEvent.password));
   }

   void _rePasswordEvent(RePasswordEvent rePasswordEvent,Emitter<SignUpStates>emit){
     emit(state.copyWith(rePassword:rePasswordEvent.rePassword));
   }
}