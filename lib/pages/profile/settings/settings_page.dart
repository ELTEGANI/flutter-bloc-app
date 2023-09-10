import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common/routes/names.dart';
import 'package:flutter_app/global/constants.dart';
import 'package:flutter_app/global/global.dart';
import 'package:flutter_app/pages/dashboard/bloc/dashboard_blocs.dart';
import 'package:flutter_app/pages/dashboard/bloc/dashboard_events.dart';
import 'package:flutter_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:flutter_app/pages/profile/settings/bloc/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../pages/profile/settings/widgets/settings_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData(){
    context.read<DashboardBlocs>().add(const TriggerDashboardEvent(0));
    Global.storageServices.remove(AppConst.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGNIN, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(),
      body:SingleChildScrollView(
        child:BlocBuilder<SettingsBlocs,SettingsStates>(
           builder:(context,state){
              return Column(
                children: [
                  settingsButton(context,removeUserData)
                ],
              );
            }
        ),
      ),
    );
  }

}
