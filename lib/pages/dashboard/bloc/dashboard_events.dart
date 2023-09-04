abstract class DashboardEvent{
   const DashboardEvent();
}
class TriggerDashboardEvent extends DashboardEvent{
  final int index;
  const TriggerDashboardEvent(this.index):super();
}