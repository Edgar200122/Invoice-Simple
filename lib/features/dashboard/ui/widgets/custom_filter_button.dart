import 'package:flutter/material.dart';
import 'package:invoice_simple/core/theme/app_colors.dart';

class CustomFilterButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final TextStyle textStyle;
  final double height;

  const CustomFilterButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.textStyle,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: selected
                  ? AppColors.primary
                  : AppColors.grey.withOpacity(0.4),
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: textStyle.copyWith(
                color: selected ? Colors.white : AppColors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
