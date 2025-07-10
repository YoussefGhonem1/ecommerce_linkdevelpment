import 'package:ecommerce_app/src/features/splash/presentation/pages/splash_page.dart';
import 'package:ecommerce_app/src/routes/app_routes.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart' show AppTheme;
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
          theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.light,
          onGenerateRoute:AppRoutes.onGenerateRoute,
          initialRoute: SplashPage.routeName,
      );
      },
    );

  }
}

 