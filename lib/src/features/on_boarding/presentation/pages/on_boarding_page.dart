import 'package:ecommerce_app/src/features/on_boarding/presentation/widgets/on_boarding_page_body.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  static const String routeName = 'onBoarding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: OnBoardingPageBody()),
    );
  }
}