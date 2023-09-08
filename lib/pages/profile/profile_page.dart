import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../pages/profile/widget/profile_widget.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
        appBar:buildAppBar(),
      body:SingleChildScrollView(
        child:SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              profileEditIcon(),
              SizedBox(height:30.h),
              Padding(
                padding:EdgeInsets.only(left:25.w),
                child: buildListView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
