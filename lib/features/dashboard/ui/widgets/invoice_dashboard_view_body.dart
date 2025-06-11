import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:invoice_simple/core/functions/get_invoice_total.dart';
import 'package:invoice_simple/core/helpers/app_assets.dart';
import 'package:invoice_simple/core/helpers/app_constants.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';
import 'package:invoice_simple/features/dashboard/data/models/invoice_model.dart';
import 'package:invoice_simple/features/dashboard/ui/cubit/invoice_dashboard_cubit.dart';
import 'package:invoice_simple/features/dashboard/ui/screens/invoice_details_view.dart';
import 'package:invoice_simple/features/dashboard/ui/widgets/custom_filter_button.dart';
import 'package:invoice_simple/features/dashboard/ui/widgets/custom_invoice_tile.dart';
import 'package:invoice_simple/features/settings/ui/screens/settings_view.dart';
import 'package:svg_flutter/svg_flutter.dart';
class InvoiceDashboardViewBody extends StatelessWidget {
  const InvoiceDashboardViewBody({super.key});



  @override
  Widget build(BuildContext context) {
    List<Color> invoiceColors = [
      const Color(0xFFB1E5AD), // green
      const Color(0xFFE7BDAB), // brown
      const Color(0xFFA9ABE5), // violet
      const Color(0xFFE2AAE6), // purple
      const Color(0xFF8E8E93), // grey
    ];

    final box = Hive.box<InvoiceModel>(AppConstants.hiveInvoiceBox);

    return BlocBuilder<InvoiceDashboardCubit, int>(
      builder: (context, selectedFilter) {
        return ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box<InvoiceModel> box, _) {
            final inviceList = box.values.toList();

            // فلترة حسب الفلتر المختار
          List<InvoiceModel> filteredList;

if (selectedFilter == 1) {
  // Outstanding
  filteredList = inviceList.where((invoice) {
    final received = invoice.receivedPayment ?? 0;
    final total = invoice.invoiceTotal ?? 0;
    final isPaymentMethodEmpty = invoice.paymentMethod == null || invoice.paymentMethod!.isEmpty;
  
    return received < total && isPaymentMethodEmpty;
  }).toList();
} else if (selectedFilter == 2) {
  // Paid
  filteredList = inviceList.where((invoice) {
    final received = invoice.receivedPayment ?? 0;
    final total = invoice.invoiceTotal ?? 0;
    return received >= total || invoice.paymentMethod?.isNotEmpty == true;
  }).toList();
} else {
  // All
  filteredList = inviceList;
}


            // حساب إجمالي الدخل بناءً على الفلتر (لو عايز تجمع الكل regardless of filter رجع inviceList)
            double totalIncome = 0;
            for (final invoice in filteredList) {
              totalIncome += getInvoiceTotal(invoice);
            }

   
                

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 24,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Income',
                                    style: AppTextStyles.poFont20BlackWh400.copyWith(
                                      fontSize: 14,
                                      color: AppColors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '\$${totalIncome.toStringAsFixed(2)}',

                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.moFont20BlackWh500.copyWith(
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: SvgPicture.asset(Assets.imagesSvgSettings),
                              onPressed: () {
                                context.push(SettingsView.routeName);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.paddingHorizontal),
                    child: Row(
                      children: [
                        CustomFilterButton(
                          label: 'All',
                          selected: selectedFilter == 0,
                          onTap: () => context.read<InvoiceDashboardCubit>().selectFilter(0),
                          textStyle: AppTextStyles.poFont20BlackWh300.copyWith(fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        CustomFilterButton(
                          label: 'Outstanding',
                          selected: selectedFilter == 1,
                          onTap: () => context.read<InvoiceDashboardCubit>().selectFilter(1),
                          textStyle: AppTextStyles.poFont20BlackWh300.copyWith(fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        CustomFilterButton(
                          label: 'Paid',
                          selected: selectedFilter == 2,
                          onTap: () => context.read<InvoiceDashboardCubit>().selectFilter(2),
                          textStyle: AppTextStyles.poFont20BlackWh300.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                 
                  filteredList.isEmpty
                      ?  Column(
                        children: [
                          SizedBox(height: 50.h),
                          Center(child: Text("no invoice"
                              ,style: AppTextStyles.poFont20BlackWh400,
                          )),
                        ],
                      )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppConstants.paddingHorizontal),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              final invoice = filteredList[index];
                              final formattedDate = DateFormat('MMM dd. yyyy').format(invoice.issuedDate);
                              final color = invoiceColors[index % invoiceColors.length];
                              return GestureDetector(
                                onTap: () {
                                  context.push(
                                  InvoiceDetailsView.routeName,
                                    extra: invoice,
                                  );
                                },
                                child: CustomInvoiceTile(
                                  circleColor: color,
                                  title: invoice.client.billTo,
                                  subtitle: (invoice.paymentMethod?.isEmpty ?? true)
                                      ? 'Received \$ ${invoice.receivedPayment??0} '
                                      : "Invoice Complete",
                                  trailing: formattedDate,
                                ),
                              );
                            },
                          ),
                        ),
                  const SizedBox(height: 175),
                ],
              ),
            );
          },
        );
      },
    );
  }
}