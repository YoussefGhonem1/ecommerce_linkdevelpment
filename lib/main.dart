import 'package:ecommerce_app/src/core/helper%20functions/on_generate_routes.dart';
import 'package:ecommerce_app/src/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const Ecommerce());
}
class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: OnGenerateRoutes,
      initialRoute: SplashPage.routeName,
      );
      },
    );
  }
}