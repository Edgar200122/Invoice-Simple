import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';

class CustomInvoiceTile extends StatelessWidget {
  final Color circleColor;
  final String title;
  final String subtitle;
  final String trailing;

  const CustomInvoiceTile({
    super.key,
    required this.circleColor,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: circleColor,
          radius: 28.r,
          child: Text(
            title[0].toUpperCase(),
            style: AppTextStyles.poFont20BlackWh600,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.poFont20BlackWh600.copyWith(fontSize: 14.sp),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.poFont20BlackWh400.copyWith(fontSize: 12.sp),
        ),
        trailing: Text(
          trailing,
          style: AppTextStyles.poFont20BlackWh400.copyWith(
            fontSize: 12.sp,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
