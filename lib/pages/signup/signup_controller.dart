import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/widgets/flutter_toast.dart';
import 'package:flutter_app/pages/signup/bloc/signup_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController{
  final BuildContext buildContext;
  const SignUpController({required this.buildContext});
  void handleEmailController() async{
    final state = buildContext.read<SignUpBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if(userName.isEmpty){
      toastInfo(msg: "userName Field cant be Empty");
      return;
    }
    if(email.isEmpty){
      toastInfo(msg: "email Field cant be Empty");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "password Field cant be Empty");
      return;
    }
    if(rePassword.isEmpty){
      toastInfo(msg: "rePassword Field cant be Empty");
      return;
    }

    try{
      final credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      if(credentials.user != null){
        await credentials.user!.sendEmailVerification();
        await credentials.user?.updateDisplayName(userName);
        toastInfo(msg: "email has been sent to your registered email. to activate please check your email box");
        Navigator.of(buildContext).pop();
      }
    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        toastInfo(msg:"The password provided is too weak");
      }else if(e.code == 'invalid-email'){
        toastInfo(msg:"your email is invalid");
      }
    }
  }
}