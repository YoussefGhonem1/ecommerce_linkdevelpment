
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
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
          subtitle: AppLocalizations.of(context)!.subtitleOnBoarding1,
          title: AppLocalizations.of(context)!.titleOnBoarding1,
          isVisible: true,
         currentPage: currentPage,
        ),

        PageViewItem(
          image: Assets.imagesImagePageItem2,
          backgroundImage: Assets.imagesBackgroudPageView2,
          title: AppLocalizations.of(context)!.titleOnBoarding2,
          subtitle: AppLocalizations.of(context)!.subtitleOnBoarding2,
          isVisible:  true,
          currentPage: currentPage,
        ),

        PageViewItem(
          image: Assets.imagesImagePageItem3,
          backgroundImage: Assets.imagesBackgroudPageView3,
          title:AppLocalizations.of(context)!.titleOnBoarding3,
          subtitle: AppLocalizations.of(context)!.subtitleOnBoarding3,
          isVisible: false, 
          currentPage: currentPage,
        )

        
      ],
    );
  }
}