import 'package:flutter/material.dart';

class BuildPriceRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isBold;
  const BuildPriceRow({super.key, required this.label, required this.value, this.isBold=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              )),
          Text(
            '\$${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
