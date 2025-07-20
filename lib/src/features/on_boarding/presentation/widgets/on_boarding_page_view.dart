
import 'package:ecommerce_app/generated/assets.dart';
import 'package:ecommerce_app/src/features/on_boarding/presentation/widgets/page_view_item.dart';
import 'package:flutter/material.dart';


class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController, required this.currentPage});
  final PageController pageController;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: Assets.imagesImagePageItem1,
          backgroundImage: Assets.imagesBackgroudPageView1,
          subtitle: 'Find the best deals on the items you love.you may shop today based on styles, colors, and more.',
          title: "Select What You Love",
          isVisible: true,
         currentPage: currentPage,
        ),

        PageViewItem(
          image: Assets.imagesImagePageItem2,
          backgroundImage: Assets.imagesBackgroudPageView2,
          title:"Track order",
          subtitle: "Stay updated with your order status and know exactly where it is, anytime.",
          isVisible:  true,
          currentPage: currentPage,
        ),

        PageViewItem(
          image: Assets.imagesImagePageItem3,
          backgroundImage: Assets.imagesBackgroudPageView3,
          title:"Get your order",
          subtitle: "We will deliver your items fast and safe, right to your doorstep.",
          isVisible: false, 
          currentPage: currentPage,
        )

        
      ],
    );
  }
}