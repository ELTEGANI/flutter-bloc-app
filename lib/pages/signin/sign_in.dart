import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/signin/widgets/sigin_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child:SafeArea(
        child:Scaffold(
          backgroundColor:Colors.white,
          appBar:buildAppBar(),
          body:SingleChildScrollView(
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                buildThirdPArtyLogin(context),
                Center(child: reusableText("Or use your email account to login")),
                Container(
                  margin:EdgeInsets.only(
                    top:66.h
                  ),
                  padding:EdgeInsets.only(left:25.w),
                  child:Column(
                    children: [
                      reusableText("Email"),
                    ],
                  ),
                )
            ],
            ),
          ),
        ),
      ),
    );
  }
}
