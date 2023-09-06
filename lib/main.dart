import 'package:flutter/material.dart';
import 'package:flutter_app/common/routes/pages.dart';
import 'package:flutter_app/common/values/colors.dart';
import 'package:flutter_app/global/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
           designSize:const Size(375,812),
            builder: (context, child) => MaterialApp(
                  theme: ThemeData(
                      appBarTheme: const AppBarTheme(
                          iconTheme:
                              IconThemeData(color: AppColors.primaryText),
                          elevation: 0,
                          backgroundColor: Colors.white)),
                  onGenerateRoute: AppPages.GenerateRouteSettings,
                )));
  }
}
