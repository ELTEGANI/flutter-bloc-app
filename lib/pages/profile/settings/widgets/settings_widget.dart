import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/base_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


AppBar buildAppBar(){
  return AppBar(
    title: Container(
      child:reusableText("Settings"),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? removeUserData) {
  return GestureDetector(
    onTap:(){
      showDialog(context: context, builder:(BuildContext context){
        return AlertDialog(
          title:const Text("Confirm Logout"),
          content:const Text("Please Confirm Logout"),
          actions: [
            TextButton(onPressed:()=>
                Navigator.of(context).pop(), child:const Text("Cancel")),
            TextButton(onPressed:removeUserData
                , child:const Text("Confirm"))
          ],
        );
      });
    },
    child: Container(
      height:100.h,
      decoration:BoxDecoration(
          image:DecorationImage(
              fit:BoxFit.fitHeight,
              image:AssetImage(
                  "assets/icons/Logout.png"
              )
          )
      ),
    ),
  );
}
