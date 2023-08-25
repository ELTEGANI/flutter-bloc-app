
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(){
  return AppBar(
    bottom:PreferredSize(
      preferredSize:const Size.fromHeight(1.0),
      child:Container(
        color:Colors.grey.withOpacity(0.5),
        height:1.0,
      ),
    ),
    title:Center(
      child: Text(
        "Log In",
        style:TextStyle(
            color:Colors.black,
            fontSize:16.sp,
            fontWeight:FontWeight.normal
        ),
      ),
    ),
  );
}

Widget buildThirdPArtyLogin(BuildContext buildContext){
   return Container(
     padding:EdgeInsets.only(
       top: 40.h,bottom:20.h
     ),
     child: Row(
       mainAxisAlignment:MainAxisAlignment.spaceAround,
       children: [
         _reusableIcons("google"),
         _reusableIcons("apple"),
         _reusableIcons("facebook")
       ],
     ),
   );
}

Widget _reusableIcons(String iconName){
  return GestureDetector(
    onTap:(){

    },
    child:SizedBox(
      width:40.w,
      height:40.w,
      child:Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text){
  return Container(
    margin:EdgeInsets.only(
      bottom:5.h
    ),
    child:Text(
      text,
      style:TextStyle(color:Colors.grey.withOpacity(0.4),
      fontWeight:FontWeight.normal,
      fontSize:14.sp),
    ),
  );
}