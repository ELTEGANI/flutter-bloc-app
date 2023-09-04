import 'package:flutter/material.dart';
import 'package:flutter_app/pages/dashboard/bloc/dashboard_blocs.dart';
import 'package:flutter_app/pages/dashboard/bloc/dashboard_events.dart';
import 'package:flutter_app/pages/dashboard/bloc/dashboard_states.dart';
import 'package:flutter_app/pages/dashboard/widget/dashboard_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return  BlocBuilder<DashboardBlocs,DashboardState>
      (builder:(context,state){
       return Container(
         color:Colors.white,
         child:SafeArea(
           child:Scaffold(
               body:buildPage(state.index),
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
                   currentIndex:state.index,
                   onTap:(value){
                     context.read<DashboardBlocs>().add(TriggerDashboardEvent(value));
                   },
                   elevation:0,
                   type:BottomNavigationBarType.fixed,
                   showSelectedLabels:false,
                   showUnselectedLabels:false,
                   selectedItemColor:AppColors.primaryElement,
                   unselectedItemColor:AppColors.primaryFourthElementText,
                   items:bottomTabs,
                 ),
               )
           ),
         ),
       );
    });
  }
}
