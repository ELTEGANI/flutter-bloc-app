import 'package:flutter_app/pages/dashboard/bloc/dashboard_events.dart';
import 'package:flutter_app/pages/dashboard/bloc/dashboard_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBlocs extends Bloc<DashboardEvent,DashboardState>{
   DashboardBlocs():super(const DashboardState()){
     on<TriggerDashboardEvent>((event,emit){
        emit(DashboardState(index:event.index));
     });
   }
}