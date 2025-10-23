import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  final Map food;
  const FoodDetailPage({super.key, required this.food});

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
            ElevatedButton(onPressed: (){}, child: Text('Añadir a la cesta')),
          ],
        ),
      ),
    );
  }
}
