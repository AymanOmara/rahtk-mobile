import 'package:flutter/material.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.textColor = RahtkColors.darkGray,
    this.dividerVisible = true,
  });

  final void Function() onTap;
  final String title;
  final Color textColor;
  final bool dividerVisible;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: dividerVisible,
              child: const Divider(),
            )
          ],
        ),
      ),
    );
  }
}
