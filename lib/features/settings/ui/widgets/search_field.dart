import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchField({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10.r);

    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.greyLight2,
        borderRadius: borderRadius,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.greyDark2, size: 24.sp),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: AppTextStyles.poFont20BlackWh400.copyWith(
                  fontSize: 17.sp,
                  color: AppColors.greyDark2,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
              style: TextStyle(
                color: AppColors.greyDark2,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
              cursorColor: AppColors.greyDark2,
            ),
          ),
        ],
      ),
    );
  }
}
