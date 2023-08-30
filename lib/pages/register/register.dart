import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../signin/widgets/sigin_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar("Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:20.h,
                ),
                Center(
                    child:
                    reusableText("Enter Your details below and free signup")),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("User Name"),
                      buildTextField(
                          "Enter Your User NAme", "name", "user",
                              (value) {
                            //context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                      reusableText("Email"),
                      buildTextField(
                          "Enter Your Email Address", "email", "user",
                              (value) {
                            //context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                      reusableText("Password"),
                      buildTextField(
                          "Enter Your Password", "password", "lock", (value) {
                       // context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                      reusableText("Re-enter your Password"),
                      buildTextField(
                          "Re-enter your password to confirm", "password", "lock", (value) {
                        // context.read<SignInBloc>().add(PasswordEvent(value));
                      })
                    ],
                  ),
                ),
                Container(
                    padding:EdgeInsets.only(left:25.w),
                    child: reusableText("By creating an account you have to agree with our privacy and conditions")),
                buildLogInAndRegistrationButton("Sign Up", "login", () {
                  Navigator.of(context).pushNamed("register");
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
