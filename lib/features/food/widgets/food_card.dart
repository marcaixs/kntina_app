import 'package:flutter/material.dart';
import 'package:kntina_app/features/food/presentation/food_detail_page.dart';

class FoodCard extends StatelessWidget {
  final Map food;
  final Function? addToCart;

  const FoodCard({
    super.key,
    required this.food,
    this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
   
    return InkWell(
      onTap: addToCart != null
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FoodDetailPage(food: food, addToCart: addToCart!),
                ),
              );
            }
          : null, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(food['images'][0], fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(food['title']),
                  Text('${food['price']} €'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}