import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:invoice_simple/core/helpers/app_constants.dart';
import 'package:invoice_simple/core/helpers/shared_pref_helper.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';
import 'package:invoice_simple/core/theme/app_text_styles.dart';
import 'package:invoice_simple/core/widgets/custom_scaffold.dart';
import 'package:invoice_simple/core/widgets/filled_text_button.dart';
import 'package:invoice_simple/features/dashboard/ui/screens/invoice_dashboard_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static const String routeName = '/onboarding';
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // confetti
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.red,
                Colors.orange,
                Colors.blue,
                Colors.green,
                Colors.purple,
              ],
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.2,
            ),
          ),

          // محتوى الصفحة
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 186.h),
                Text(
                  "Welcome to the world of lightning-fast invocing",
                  textAlign: TextAlign.start,

                  style: AppTextStyles.moFont20BlackWh500.copyWith(
                    color: AppColors.darkTextColor,
                  ),
                ),

                const SizedBox(height: 16),

                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: AppTextStyles.moFont20BlackWh500.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.darkTextColor,
                    ),
                    children: [
                      const TextSpan(text: "Create up to "),
                      TextSpan(
                        text: "2 free invoices",
                        style: AppTextStyles.moFont20BlackWh500.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const TextSpan(text: " and "),
                      TextSpan(
                        text: "send 1",
                        style: AppTextStyles.moFont20BlackWh500.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const TextSpan(text: " as part of your free trial."),
                    ],
                  ),
                ),

                const Spacer(),

                FilledTextButton(
                  onPressed: (){
                    SharedPrefHelper.setData(AppConstants.prefsNotFirstLogin, true);
                    context.go(InvoiceDashboardView.routeName);
                  },
                  text: "Create New Invoice",
                ),

                SizedBox(height: 68.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
