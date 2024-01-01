import 'package:fic10_cbt/core/constants/colors.dart';
import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentPage;
  final int length;

  const OnboardingIndicator({
    super.key,
    required,
    required this.currentPage,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 10,
          width: currentPage == index ? 20 : 10,
          decoration: BoxDecoration(
            color: currentPage == index ? AppColors.primary : AppColors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
