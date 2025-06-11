import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_simple/core/di/dependency_injection.dart';
import 'package:invoice_simple/core/helpers/app_constants.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/widgets/filled_text_button.dart';
import 'package:invoice_simple/core/widgets/outlined_text_button.dart';
import 'package:invoice_simple/features/dashboard/ui/cubit/invoice_dashboard_cubit.dart';
import 'package:invoice_simple/features/dashboard/ui/screens/new_invoice_view.dart';
import 'package:invoice_simple/features/dashboard/ui/widgets/invoice_dashboard_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InvoiceDashboardView extends StatelessWidget {
  const InvoiceDashboardView({super.key});
  static const String routeName = '/invoice-dashboard';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<InvoiceDashboardCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: InvoiceDashboardViewBody(),
        bottomNavigationBar: Container(
          color: AppColors.white,
          padding: EdgeInsets.only(
            left: AppConstants.paddingHorizontal,
            right: AppConstants.paddingHorizontal,
            bottom: 5,
            top: 2,
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledTextButton(
                  onPressed: () => context.push(NewInvoiceView.routeName),
                  text: "Create Invoice",
                ),
                SizedBox(height: 8),
                OutlinedTextButton( 
                  onPressed: ()  => context.push(NewInvoiceView.routeName,extra: true),
            
                  text: "Create Estimates",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}