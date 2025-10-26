import 'package:flutter/material.dart';
import 'package:kntina_app/features/food/widgets/food_card.dart';

class FoodGrid extends StatelessWidget {
  final List foodList;
  final Function? addToCart;

  const FoodGrid({super.key, required this.foodList, this.addToCart});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: foodList.length,
      itemBuilder: (context, index) {
        return FoodCard(
          food:foodList[index],
          addToCart: addToCart,
        );
      },
    );
  }
}
