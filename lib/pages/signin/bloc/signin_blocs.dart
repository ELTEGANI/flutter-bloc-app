import 'package:flutter_app/pages/signin/bloc/signin_events.dart';
import 'package:flutter_app/pages/signin/bloc/signin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent emailEvent, Emitter<SignInState> emit) {
    print("my email is : ${emailEvent.email}");
    emit(state.copyWith(email: emailEvent.email));
  }

  void _passwordEvent(PasswordEvent passwordEvent, Emitter<SignInState> emit) {
    print("my password is : ${passwordEvent.password}");
    emit(state.copyWith(password: passwordEvent.password));
  }
}
