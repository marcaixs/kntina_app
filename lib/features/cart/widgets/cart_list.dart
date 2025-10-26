import 'package:flutter/material.dart';
import 'package:kntina_app/features/cart/widgets/cart_food_card.dart';

class CartList extends StatelessWidget {
  final List cartList;
  final Function(int, int)? updateQuantity;
  final Function(int)? removeItem;

  const CartList({
    super.key,
    required this.cartList,
    this.updateQuantity,
    this.removeItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: cartList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              CartFoodCard(
                item: cartList[index],
                updateQuantity: updateQuantity,
                removeItem: removeItem,
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}