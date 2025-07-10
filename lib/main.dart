import 'package:ecommerce_app/src/features/splash/presentation/pages/splash_page.dart';
import 'package:ecommerce_app/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Ecommerce App',
          debugShowCheckedModeBanner: false,
          onGenerateRoute:AppRoutes.onGenerateRoute,
          initialRoute: SplashPage.routeName,
      );
      },
    );

  }
}

 