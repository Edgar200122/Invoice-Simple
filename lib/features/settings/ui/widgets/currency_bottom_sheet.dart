import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';
import 'package:invoice_simple/features/settings/data/model/currency_model.dart';


class CurrencyBottomSheet extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selected;

  const CurrencyBottomSheet({
    required this.items,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mostRecent = items.firstWhere(
      (c) => c.code == selected.code,
      orElse: () => items.first,
    );

    return Container(
     
      height: MediaQuery.of(context).size.height * 0.85, 
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // مهم جداً
          children: [

            SizedBox(height: 26.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric( horizontal: 24),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close, size: 24, color: Colors.black),
                ),
              ),
            ),
        SizedBox(height: 22.h),
             Text(
                        'Currency',
                        style: AppTextStyles.poFont20BlackWh600.copyWith(fontSize: 26.sp),
                      ),
            // Most recent label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Most recent',
                  style: AppTextStyles.poFont20BlackWh400.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.blueGrey,
                  ),
                ),
              ),
            ),
            
            // Most recent currency item
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () => Navigator.pop(context, mostRecent),
                borderRadius: BorderRadius.circular(7),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Text(
                        mostRecent.code,
                        style: AppTextStyles.poFont20BlackWh600.copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(width: 2.w),
                      if (mostRecent.code == selected.code)
                        Icon(Icons.check, size: 18.sp, color: AppColors.black),
                      const Spacer(),
                      Text(
                        mostRecent.name,
                        style: AppTextStyles.poFont20BlackWh400.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // All currencies label
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'All currencies',
                  style: AppTextStyles.poFont20BlackWh400.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.blueGrey,
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 8.h),
            
            Divider(
              height: 1,
              color: AppColors.extraLightGreyDivder,
            ),
            
            SizedBox(height: 8.h),
            
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final currency = items[index];
                  return InkWell(
                    onTap: () => Navigator.pop(context, currency),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50.w,
                            child: Text(
                              currency.code,
                              style: AppTextStyles.poFont20BlackWh400.copyWith(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              currency.name,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.poFont20BlackWh400.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.blueGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              
            ),
              SizedBox(height: 35.h),

          ],
        ),
      ),
    );
  }
}