import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Map food;

  const FoodCard({
    super.key,
    required this.food
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(food['images'][0], fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text(food['title']), Text('${food['price']} €')],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
