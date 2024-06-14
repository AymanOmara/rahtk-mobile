import 'package:flutter/material.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';

class ReminderProductWidget extends StatelessWidget {
  const ReminderProductWidget({
    super.key,
    required this.product,
    required this.onPress,
  });

  final ProductDisplay product;
  final void Function(ProductDisplay) onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(product),
      child: Stack(
        children: [
          Container(
            padding:const EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: RahtkColors.lightGray,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                    0.1,
                  ),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Text(
              product.localizedName,
            ),
          ),
          Positioned(
            child: Visibility(
              visible: product.selected,
              child:const Icon(
                Icons.add_circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
