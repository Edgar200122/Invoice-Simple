import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:invoice_simple/core/helpers/app_assets.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';
import 'package:invoice_simple/features/dashboard/ui/widgets/invoice_header_section.dart';
import 'package:svg_flutter/svg.dart';




class InvoiceStatusSection extends StatefulWidget {
  const InvoiceStatusSection({
    super.key,
    this.onPaymentMethodSelected,
    this.initialPaymentMethod,
    this.initialPaidDate, // الإضافة هنا
  });
  final void Function(PaymentMethod)? onPaymentMethodSelected;
  final PaymentMethod? initialPaymentMethod;
  final DateTime? initialPaidDate;

  @override
  State<InvoiceStatusSection> createState() => _InvoiceStatusSectionState();
}

class _InvoiceStatusSectionState extends State<InvoiceStatusSection> {
  bool isPaid = false;
  DateTime? paidDate;
  PaymentMethod? selectedMethod;

  @override
  void initState() {
    super.initState();
    // لو فيه طريقة دفع ابتدائية، استخدمها
    if (widget.initialPaymentMethod != null) {
      selectedMethod = widget.initialPaymentMethod;
      isPaid = true;
      paidDate = widget.initialPaidDate ?? DateTime.now();
    }
  }

  void _showMarkAsPaidSheet() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const MarkAsPaidBottomSheet(),
    );
    if (result != null) {
      setState(() {
        isPaid = true;
        paidDate = result['date'] as DateTime;
        selectedMethod = result['method'] as PaymentMethod;
      });
      if (widget.onPaymentMethodSelected != null && selectedMethod != null) {
        widget.onPaymentMethodSelected!(selectedMethod!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isPaid) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Text(
              'Has Invoice Been Paid?',
              style: AppTextStyles.poFont20BlackWh600.copyWith(fontSize: 12.sp),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                _showMarkAsPaidSheet();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Mark as Paid',
                  style: AppTextStyles.poFont20BlackWh400.copyWith(
                    color: AppColors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              Text(
                'Marked as Paid',
                style: AppTextStyles.poFont20BlackWh400.copyWith(fontSize: 12.sp),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    _formatDate(paidDate ?? DateTime.now()),
                    style: AppTextStyles.poFont20BlackWh400.copyWith(
                      color: AppColors.blueGrey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.calendar_month, size: 18, color: AppColors.blueGrey),
                ],
              ),
            ],
          ),
          Divider(color: AppColors.extraLightGreyDivder),
        ],
      );
    }
  }

  String _formatDate(DateTime date) {
    return "${DateFormat('yyyy-MM-dd').format(date)}";
  }

  
}


class MarkAsPaidBottomSheet extends StatefulWidget {
  const MarkAsPaidBottomSheet({super.key});

  @override
  State<MarkAsPaidBottomSheet> createState() => _MarkAsPaidBottomSheetState();
}

class _MarkAsPaidBottomSheetState extends State<MarkAsPaidBottomSheet> {
  PaymentMethod? selectedMethod;

  @override
  Widget build(BuildContext context) {
   

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(18, 24, 18, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Mark as Paid",
            style: AppTextStyles.poFont20BlackWh600.copyWith(fontSize: 16.sp),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Text( 
              "${ DateFormat('yyyy-MM-dd').format(DateTime.now())}",
              style: AppTextStyles.poFont20BlackWh600.copyWith(
                fontSize: 12.sp,
                color: AppColors.white,
              ),
            ),  
          ),
           SizedBox(height: 14.h),
          Text(
            "Select How You Received the money",
            style: AppTextStyles.poFont20BlackWh400.copyWith(
              fontSize: 12.sp,
              color: AppColors.lightBlue
            ),
            textAlign: TextAlign.center,
          ),
           SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMethodIcon(context, PaymentMethod.cash, Assets.imagesSvgChash, "Cash"),
              _buildMethodIcon(context, PaymentMethod.check, Assets.imagesSvgCheck, "Check"),
              _buildMethodIcon(context, PaymentMethod.bank, Assets.imagesSvgBank, "Bank"),
              _buildMethodIcon(context, PaymentMethod.paypal, Assets.imagesSvgPaypal, "PayPal"),
            ],
          ),
           SizedBox(height: 58.h),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Text(
              "Cancel",
              style: AppTextStyles.poFont20BlackWh400.copyWith(
                color: AppColors.blueGrey,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildMethodIcon(BuildContext context, PaymentMethod method, String asset, String label) {
    final isSelected = selectedMethod == method;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = method;
        });
        // انتظر ربع ثانية ثم أغلق مع إرجاع البيانات
        Future.delayed(const Duration(milliseconds: 250), () {
          Navigator.of(context).pop({
            'method': method,
            'date': DateTime(2025, 5, 6),
          });
        });
      },
      child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
       
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.08) : AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.extraLightGreyDivder,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column( 
          children: [
            Center(
              child: SvgPicture.asset(asset, width: 34, height: 34),
            ),
            SizedBox(height: 5.h),
            Text(
            label,
            style: AppTextStyles.poFont20BlackWh400.copyWith(
              color: AppColors.black,
              fontSize: 13,
            ),
          )
          ],
        ),
      ),
    );
  }
}