import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/common/widgets/flutter_toast.dart';
import 'package:flutter_app/global/constants.dart';
import 'package:flutter_app/global/global.dart';
import 'package:flutter_app/pages/signin/bloc/signin_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext buildContext;

  const SignInController({required this.buildContext});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = buildContext.read<SignInBlocs>().state;
        String emailAddress = state.email;
        String passWord = state.password;
        if (emailAddress.isEmpty || passWord.isEmpty) {
          toastInfo(msg: "You need to fill empty fields");
          return;
        }
        try {
          final credentials = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: passWord);
          if (credentials.user == null) {
            toastInfo(msg: "You don't exists");
            return;
          }
          // if (!credentials.user!.emailVerified) {
          //   toastInfo(msg: "You need verified your email account");
          //   return;
          // }
          var user = credentials.user;
          if (user != null) {
            print("user exits");
            Global.storageServices.setString(AppConst.STORAGE_USER_TOKEN_KEY, "123");
            Navigator.of(buildContext).pushNamedAndRemoveUntil("/dashboard", (route) => false);
          } else {
            toastInfo(msg: "Currently Your arnt a user  of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that user");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "your email format is wrong");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
