import 'package:flutter/material.dart';
import 'package:kntina_app/features/cart/widgets/cart_food_card.dart';

class CartList extends StatelessWidget {
  final List cartList;
  const CartList({super.key, required this.cartList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: cartList.length,
        itemBuilder: (BuildContext context, int index) {
          return CartFoodCard(item: cartList[index]);
        },
      ),
    );
  }
}
