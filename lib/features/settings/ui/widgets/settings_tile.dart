import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isHaveIcon;
  const SettingsTile({super.key, required this.title, required this.onTap, this.isHaveIcon = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(

          title: Text(
            title,
            style: AppTextStyles.poFont20BlackWh400.copyWith(fontSize: 14.sp),
          ),
          trailing: isHaveIcon ? Icon(Icons.arrow_forward_ios, color: AppColors.black, size: 20) : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          onTap: onTap,
          dense: true,
          minVerticalPadding: 0,     

          horizontalTitleGap: 8,
        ), 
       
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 0),
            child: Divider(
              color: AppColors.lightGrey,
              height: 0,
              thickness: 1,
            ),
          ),
      ],
    );
  }}