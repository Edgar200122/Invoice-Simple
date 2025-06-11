import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';

class CustomSelectItem extends StatelessWidget {
  const CustomSelectItem({super.key, required this.text, required this.onPressed});
final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
  padding: EdgeInsets.symmetric(horizontal: 12.w, ),
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(5.r),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.poFont20BlackWh600.copyWith(fontSize: 12.sp),
      ),
      IconButton(
        icon: Icon(Icons.close, color: AppColors.red),
        onPressed: onPressed,
      ),
    ],
  ),
);
  }
}