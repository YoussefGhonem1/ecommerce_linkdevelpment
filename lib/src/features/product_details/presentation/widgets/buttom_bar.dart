
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8E6CEF),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFF8E6CEF).withAlpha(150),
          minimumSize: const Size(double.infinity, 56),
        ),
        child: Row(
          children: [
            Text(
              '\$148',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Text(
              'Add to Bag',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
