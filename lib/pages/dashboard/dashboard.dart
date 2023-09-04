import 'package:flutter/material.dart';
import 'package:flutter_app/pages/dashboard/dashboard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return  Container(
      color:Colors.white,
      child:SafeArea(
        child:Scaffold(
          body:buildPage(_index),
              bottomNavigationBar:Container(
                width:375.w,
                height:58.h,
                decoration:BoxDecoration(
                  color:AppColors.primaryElement,
                  borderRadius:BorderRadius.only(
                    topLeft:Radius.circular(20.h),
                    topRight:Radius.circular(20.h)
                  ),
                  boxShadow:[
                    BoxShadow(
                      color:Colors.grey.withOpacity(0.1),
                      blurRadius:1,
                      spreadRadius:1
                    )
                  ]
                ),
                child: BottomNavigationBar(
                  currentIndex:_index,
                  onTap:(value){
                    setState(() {
                      _index = value;
                    });
                  },
                  elevation:0,
                  type:BottomNavigationBarType.fixed,
                  showSelectedLabels:false,
                  showUnselectedLabels:false,
                  selectedItemColor:AppColors.primaryElement,
                  unselectedItemColor:AppColors.primaryFourthElementText,
                  items: [
                    BottomNavigationBarItem(
                      label:"Home",
                      icon:SizedBox(
                        width:15.w,
                        height:15.h,
                        child:Image.asset("assets/icons/home.png"),
                      ),
                      activeIcon:SizedBox(
                        width:15.w,
                        height:15.h,
                        child:Image.asset("assets/icons/home.png",color:
                        AppColors.primaryElement),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label:"Search",
                      icon:SizedBox(
                        width:15.w,
                        height:15.h,
                        child:Image.asset("assets/icons/search2.png"),
                      ),
                      activeIcon:SizedBox(
                        width:15.w,
                        height:15.h,
                        child:Image.asset("assets/icons/search2.png",color:
                        AppColors.primaryElement),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label:"Course",
                      icon:SizedBox(
                        width:15.w,
                        height:15.h,
                        child:Image.asset("assets/icons/play-circle1.png"),
                      ),
                      activeIcon:SizedBox(
                        width:15.w,
                        height:15.h,
                        child:Image.asset("assets/icons/play-circle1.png",color:
                        AppColors.primaryElement),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label:"Chat",
                      icon:SizedBox(
                        width:15.w,
                        height:15.h,
                        child:Image.asset("assets/icons/message-circle.png"),
                      ),
                      activeIcon:SizedBox(
                        width:15.w,
                        height:15.h,
                        child:Image.asset("assets/icons/message-circle.png",color:
                        AppColors.primaryElement),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label:"Profile",
                      icon:SizedBox(
                        width:15.w,
                        height:15.h,
                        child:Image.asset("assets/icons/person2.png"),
                      ),
                      activeIcon:SizedBox(
                        width:15.w,
                        height:15.h,
                        child:Image.asset("assets/icons/person2.png",color:
                        AppColors.primaryElement),
                      ),
                    )
                  ],
                ),
              )
        ),
      ),
    );
  }
}
