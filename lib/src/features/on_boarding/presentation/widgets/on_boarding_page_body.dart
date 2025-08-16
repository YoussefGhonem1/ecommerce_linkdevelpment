import 'package:ecommerce_app/src/features/on_boarding/presentation/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingPageBody extends StatefulWidget {
  const OnBoardingPageBody({super.key});

  @override
  State<OnBoardingPageBody> createState() => _OnBoardingPageBodyState();
}

class _OnBoardingPageBodyState extends State<OnBoardingPageBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
            currentPage: currentPage,
          ),
        ),
      ],
    );
  }
}