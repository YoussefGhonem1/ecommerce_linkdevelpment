import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:ecommerce_app/src/features/on_boarding/presentation/widgets/custom_button_onboarding.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subtitle,
      required this.title,
      required this.isVisible,
      required this.currentPage});

  final String image, backgroundImage, subtitle, title;
  final bool isVisible;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(
              visible: isVisible,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.signInEmail);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.03, horizontal: size.width * 0.06,),
                  child: Text(
                    AppLocalizations.of(context)!.skip,
                    style:Theme.of(context).textTheme.bodyMedium
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.85,
          height: size.height * 0.34,
          child: SvgPicture.asset(image),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: size.height * 0.51,
                child: SizedBox(
                  width: double.infinity,
                  height: size.height * 0.51,
                  child: SvgPicture.asset(
                    backgroundImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.05),
                    Text(
                      title,
                      style:  Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: size.height * 0.015),
                    Text(
                      subtitle,
                      style:  Theme.of(context).textTheme.bodyMedium
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DotsIndicator(
                      dotsCount: 3,
                      position: currentPage.toDouble(),
                      decorator: DotsDecorator(
                        color: AppColors.bgDarkColor
                            .withAlpha((0.5 * 255).toInt()),
                        activeColor: AppColors.bgDarkColor,
                        size: Size(10.0, 10.0),
                        activeSize: Size(22.0, 10.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    SizedBox(height:  23),
                    Visibility(
                        visible: currentPage == 2 ? true : false,
                        maintainState: true,
                        maintainAnimation: true,
                        maintainSize: true,
                        child: CustomButtonOnboarding(
                          onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.signInEmail);
                          }, 
                          label: AppLocalizations.of(context)!.letsStart,
                        ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

