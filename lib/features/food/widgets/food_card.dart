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
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 250,  
              width: double.infinity,
              child: Image.network(
                food['images'][0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Column(
              children: [
                Text(
                  food['title'],
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  '${food['price']} €',
                  style: const TextStyle(color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
