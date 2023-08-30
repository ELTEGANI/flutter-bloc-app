import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/signin/bloc/signin_blocs.dart';
import 'package:flutter_app/pages/signin/bloc/signin_events.dart';
import 'package:flutter_app/pages/signin/bloc/signin_states.dart';
import 'package:flutter_app/pages/signin/signin_controller.dart';
import 'package:flutter_app/pages/signin/widgets/sigin_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Log In"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPArtyLogin(context),
                  Center(
                      child:
                          reusableText("Or use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(height: 5.h),
                        buildTextField(
                            "Enter Your Email Address", "email", "user",
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        SizedBox(height: 5.h),
                        buildTextField(
                            "Enter Your Password", "password", "lock", (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        })
                      ],
                    ),
                  ),
                  forgetPassword(),
                  buildLogInAndRegistrationButton("Sign In", "login", () {
                    SignInController(buildContext: context)
                        .handleSignIn("email");
                  }),
                  buildLogInAndRegistrationButton("Sign Up", "register", () {
                    Navigator.of(context).pushNamed("register");
                  })
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
