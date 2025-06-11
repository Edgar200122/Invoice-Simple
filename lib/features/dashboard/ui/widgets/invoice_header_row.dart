import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';

class InvoiceHeaderRow extends StatelessWidget {
  final String issued;
  final String due;
  final String number;
final void Function()?  onIssuedTap;
  const InvoiceHeaderRow({
    super.key,
    required this.issued,
    required this.due,
    required this.number,
    this.onIssuedTap
  });

  @override
  Widget build(BuildContext context) {
  


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Text("Issued",
                    textAlign: TextAlign.start,
                    style:AppTextStyles.poFont20BlackWh400.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.blueGrey,
                    )
                    
                    ),
              ),
              Expanded(
                flex: 4,
                child: Text("Due",
                    textAlign: TextAlign.left,
                   style:AppTextStyles.poFont20BlackWh400.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.blueGrey,
                    )),
              ),
              Expanded(
                flex: 2,
                child: Text("#",
                    textAlign: TextAlign.right,
                        style:AppTextStyles.poFont20BlackWh400.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.blueGrey,
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
      
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Row(
            children: [
              // Issued
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: onIssuedTap,
                  child: Container(
                    padding: const EdgeInsets.only(left: 0, right: 8, top: 9, bottom: 9),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.r))
                    ),
                    child: Text(
                      issued,
                      style: AppTextStyles.poFont20BlackWh400.copyWith(
                        fontSize: 12.sp,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ),
              // Divider
              Container(
                width: 1,
                height: 40,
                color: AppColors.lightGrey
              ),
              // Due
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                  child: Text(
                    due,
                    style: AppTextStyles.poFont20BlackWh400.copyWith(
                      fontSize: 12.sp,
                      color: AppColors.blueGrey,
                    ),
                  ),
                ),
              ),
              // Divider
               Container(
                width: 1,
                height: 40,
                color: AppColors.lightGrey
              ),
              // Number
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    number,
                    style:  AppTextStyles.poFont20BlackWh400.copyWith(
                      fontSize: 12.sp,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}