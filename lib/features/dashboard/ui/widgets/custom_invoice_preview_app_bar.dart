import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_simple/core/helpers/app_constants.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';

class CustomInvoicePreviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomInvoicePreviewAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.paddingHorizontal,),
          child: Row(
            children: [
    
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text( "Done",
                    style: AppTextStyles.poFont20BlackWh400.copyWith(
                      fontSize: 14.sp
                    )
                    ),
              ),
              const Spacer(),
              Text(
                "Preview",
                 style: AppTextStyles.poFont20BlackWh600.copyWith(
                      fontSize: 14.sp
                    ),
              ),
              const SizedBox(width: 12),
              Text(
                "Customize",
               style: AppTextStyles.poFont20BlackWh400.copyWith(
                      fontSize: 14.sp
    
                    ) 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
