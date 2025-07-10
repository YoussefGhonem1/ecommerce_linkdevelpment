import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.image, required this.backgroundimage, required this.subtitle, required this.title,required this.isVisible});
  final String image, backgroundimage, subtitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [   
      ],
    );
  }
}