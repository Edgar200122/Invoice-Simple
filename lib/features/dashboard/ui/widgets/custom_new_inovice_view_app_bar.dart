import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_simple/core/helpers/app_constants.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';
import 'package:invoice_simple/features/dashboard/ui/screens/inoice_preview_view.dart';

class CustomNewInoviceViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomNewInoviceViewAppBar({
    super.key, required this.onPreview, required this.onDone,
  });
final VoidCallback onPreview;
final VoidCallback onDone;
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
                  context.pop();
                },
                child: Text("Cancel",
                    style: AppTextStyles.poFont20BlackWh400.copyWith(
                      fontSize: 14.sp
                    )
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () =>
                  onPreview(),
                  
                
                child: Text(
                "Preview",
                 style: AppTextStyles.poFont20BlackWh400.copyWith(
                      fontSize: 14.sp
                    ),
              ),),
              const SizedBox(width: 12), 
              TextButton(
                onPressed: () =>onDone(),
                child: Text(
                  "Done",
                  style: AppTextStyles.poFont20BlackWh600.copyWith(
                    fontSize: 14.sp
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
