import 'package:flutter/material.dart';
import 'package:flutter_app/common/routes/pages.dart';
import 'package:flutter_app/common/values/colors.dart';
import 'package:flutter_app/pages/bloc_providers.dart';
import 'package:flutter_app/pages/dashboard/dashboard.dart';
import 'package:flutter_app/pages/signin/sign_in.dart';
import 'package:flutter_app/pages/signup/sign_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/welcome/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocProviders(context)],
        child: ScreenUtilInit(
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
