import 'package:get_it/get_it.dart';
import 'package:invoice_simple/features/dashboard/ui/cubit/invoice_dashboard_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //ToDo:------------------------ Dashboard ------------------------
  getIt.registerFactory<InvoiceDashboardCubit>(() => InvoiceDashboardCubit());
}
