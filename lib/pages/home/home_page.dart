import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/bloc/home_page_blocs.dart';
import 'package:flutter_app/pages/home/bloc/home_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/values/colors.dart';
import '../home/widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBlocs, HomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: homePageText(
                        "Hello,", color: AppColors.primaryThirdElementText),
                ),
                SliverToBoxAdapter(child: homePageText("dbestech", color: AppColors.primaryText, top: 5)),
                SliverPadding(padding:EdgeInsets.only(top:20.h)),
                SliverToBoxAdapter(child: searchView()),
                SliverToBoxAdapter(child: slidersView(context, state)),
                SliverToBoxAdapter(child: menuView())
              ],
            ),
          );
        },
      ),
    );
  }
}
