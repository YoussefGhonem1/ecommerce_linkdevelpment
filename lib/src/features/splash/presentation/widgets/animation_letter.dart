import 'package:flutter/material.dart';

class AnimatedLetter extends StatelessWidget {
  final String char;
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;
  final bool raise;

  const AnimatedLetter({
    required this.char,
    required this.slideAnimation,
    required this.fadeAnimation,
    this.raise = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget letter = SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Text(
          char,
          style: const TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    if (raise) {
      letter = Transform.translate(offset: const Offset(0, -5), child: letter);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: letter,
    );
  }
}
