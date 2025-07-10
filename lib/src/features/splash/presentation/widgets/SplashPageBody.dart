import 'package:flutter/material.dart';


class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [/*SvgPicture.asset(Assets.imagesPlant)*/]),
        //SvgPicture.asset(Assets.imagesLogo),
        //SvgPicture.asset(Assets.imagesCircles, fit: BoxFit.fill,),
      ],
    );
  }
  
  void excuteNavigation() {
    //bool isOnBoardingViewSeen = Prefs.getBool(KisOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      /*isOnBoardingViewSeen
          ? Navigator.pushReplacementNamed(context, LoginPage.routeName)
          :Navigator.pushReplacementNamed(context, OnBoardingPage.routeName);*/
    });
  }
}