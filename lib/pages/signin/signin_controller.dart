import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/signin/bloc/signin_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext buildContext;

  const SignInController({required this.buildContext});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = buildContext.read<SignInBloc>().state;
        String emailAddress = state.email;
        String passWord = state.password;
        if (emailAddress.isEmpty) {}
        if (passWord.isEmpty) {}
        try {
          final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailAddress, password: passWord);
          if(credentials.user==null){

          }
          if(!credentials.user!.emailVerified){

          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
