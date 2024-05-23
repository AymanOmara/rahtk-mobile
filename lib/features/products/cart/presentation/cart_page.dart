import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/features/products/cart/business_logic/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        CartCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cubit.products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      color: Colors.red,
                    );
                  },
                ),
              ),
              Text(
                cubit.products
                    .map((e) => e.getFullPrice())
                    .reduce((value, element) => value + element)
                    .toString(),
                style:const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
