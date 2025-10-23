import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  final Map food;
  final Function addToCart;
  const FoodDetailPage({super.key, required this.food, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                children: [
                  Image.network(food['images'][0]),
                  Image.network(food['images'][1]),
                  Image.network(food['images'][2]),
                ],
              ),
            ),
            Text(food['price'].toString()),
            Text(food['description']),
            ElevatedButton(onPressed: (){addToCart(food);}, child: Text('Añadir a la cesta')),
          ],
        ),
      ),
    );
  }
}
