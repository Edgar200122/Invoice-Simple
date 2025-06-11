import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice_simple/core/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isNotFirstLogin});
final bool isNotFirstLogin;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      builder: (_, child) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
          ),
        );

        return MaterialApp.router(
          theme: ThemeData.light(),

          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.getRouter(isNotFirstLogin),
        );
      },
    );
  }
}
