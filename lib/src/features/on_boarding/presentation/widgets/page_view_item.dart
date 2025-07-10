import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/src/features/on_boarding/presentation/widgets/custom_button_onboarding.dart';
import 'package:ecommerce_app/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final double backgroundHeight =
        backgroundImage.contains("2") ? 375.h : 430.h;
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
                  //Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                },
                child: Padding(
                  padding: REdgeInsets.symmetric(vertical: 25, horizontal: 30),
                  child: Text(
                    "Skip",
                    style: AppTextStyles.regular13
                        .copyWith(color: Color(0xFF4E5456)),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 337.w,
          height: 298.h,
          child: SvgPicture.asset(image),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: backgroundHeight,
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h,),
                    Text(
                      title,
                      style: AppTextStyles.bold19,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.regular16,
                    ),
                    SizedBox(
                      height: 20.h,
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
                    SizedBox(height:  23.h),
                    Visibility(
                        visible: currentPage == 2 ? true : false,
                        maintainState: true,
                        maintainAnimation: true,
                        maintainSize: true,
                        child: CustomButtonOnboarding(
                          onPressed: () {
                            //Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                          }, 
                          label: 'Let\'s Start',
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
