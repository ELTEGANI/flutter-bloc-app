import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/signin/bloc/signin_blocs.dart';
import 'package:flutter_app/pages/signin/bloc/signin_states.dart';
import 'package:flutter_app/pages/signup/bloc/signup_bloc.dart';
import 'package:flutter_app/pages/signup/bloc/signup_events.dart';
import 'package:flutter_app/pages/signup/signup_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../signin/widgets/sigin_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs,SignInState>(builder:(context,state){
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
                               context.read<SignUpBlocs>().add(UserNameEvent(value));
                             }),
                         reusableText("Email"),
                         buildTextField(
                             "Enter Your Email Address", "email", "user",
                                 (value) {
                                   context.read<SignUpBlocs>().add(EmailEvent(value));
                             }),
                         reusableText("Password"),
                         buildTextField(
                             "Enter Your Password", "password", "lock", (value) {
                           context.read<SignUpBlocs>().add(PasswordEvent(value));
                         }),
                         reusableText("Re-enter your Password"),
                         buildTextField(
                             "Re-enter your password to confirm", "password", "lock", (value) {
                           context.read<SignUpBlocs>().add(RePasswordEvent(value));
                         })
                       ],
                     ),
                   ),
                   Container(
                       padding:EdgeInsets.only(left:25.w),
                       child: reusableText("By creating an account you have to agree with our privacy and conditions")),
                   buildLogInAndRegistrationButton("Sign Up", "login", () {
                     //Navigator.of(context).pushNamed("register");
                     SignUpController(buildContext:context).handleEmailController();
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
