import 'package:flutter/material.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';

class DottedWidget extends StatelessWidget {
  const DottedWidget({
    super.key,
    required this.totalSlides,
    required this.currentIndex,
  });

  final int totalSlides;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSlides,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: RahtkColors.tealColor.withOpacity(
                index == currentIndex ? 1 : 0.5,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
