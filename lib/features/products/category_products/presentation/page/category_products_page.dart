import 'package:flutter/material.dart';
import 'package:rahtk_mobile/features/main/home/display/category_display.dart';
import 'package:rahtk_mobile/features/main/home/presentation/widgets/product_widget.dart';
import 'package:rahtk_mobile/features/products/category_products/presentation/widgets/product_category_navigation_bar.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({
    super.key,
    required this.category,
  });

  final CategoryDisplay category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProductCategoryNavigationBar(
            title: category.localizedName,
          ),
          SingleChildScrollView(
            child: Wrap(
              runSpacing: 10,
              children: category.products
                  .map(
                    (e) => ProductWidget(product: e),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
