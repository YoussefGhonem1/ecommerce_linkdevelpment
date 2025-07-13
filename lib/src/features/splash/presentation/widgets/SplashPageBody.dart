import 'package:ecommerce_app/src/features/splash/presentation/widgets/animation_letter.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/features/on_boarding/presentation/pages/on_boarding_page.dart';


class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody>
    with TickerProviderStateMixin {
  final String word = 'Clot';

  final List<Offset> entryOffsets = [
    const Offset(-2, 0),
    const Offset(0.0, -2),
    const Offset(0.0, 2),
    const Offset(2, 0),
  ];

  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _slideAnimations;
  late final List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(word.length, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
      );
    });

    _slideAnimations = List.generate(word.length, (index) {
      return Tween<Offset>(
        begin: entryOffsets[index],
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _controllers[index],
        curve: Curves.easeOutBack,
      ));
    });

    _fadeAnimations = List.generate(word.length, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controllers[index],
        curve: Curves.easeIn,
      ));
    });

    startAnimations();
    navigateToOnBoarding();
  }

  Future<void> startAnimations() async {
    for (var controller in _controllers) {
      await Future.delayed(const Duration(milliseconds: 300));
      controller.forward();
    }
  }

  void navigateToOnBoarding() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, OnBoardingPage.routeName);
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(word.length, (index) {
            return AnimatedLetter(
              char: word[index],
              slideAnimation: _slideAnimations[index],
              fadeAnimation: _fadeAnimations[index],
              raise: word[index] == 'l',
            );
          }),
        ),
    );
  }
}
