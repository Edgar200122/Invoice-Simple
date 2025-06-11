import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';

class FilledTextButton extends StatelessWidget {
  const FilledTextButton({
    super.key, required this.text, required this.onPressed,
    this.color,
  });
final String text ;
 final VoidCallback? onPressed;
 final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
    
     
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
               padding: EdgeInsets.all(14.r),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.moFont20BlackWh500.copyWith(
              color: AppColors.white,
              fontSize: 12.sp,
            ),
          ),
        ),
      )
    ;
  }
}
