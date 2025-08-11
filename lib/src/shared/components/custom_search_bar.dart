import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Search',
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        style: TextStyle(color: theme.textTheme.bodyMedium?.color),
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: theme.iconTheme.color),
          hintText: hintText,
          hintStyle: theme.inputDecorationTheme.hintStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
