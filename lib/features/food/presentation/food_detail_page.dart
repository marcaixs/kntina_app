import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  final Map food;
  final Function addToCart;
  const FoodDetailPage({
    super.key,
    required this.food,
    required this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 550,
                    child: PageView(
                      children: [
                        Image.network(food['images'][0], fit: BoxFit.cover),
                        Image.network(food['images'][1], fit: BoxFit.cover),
                        Image.network(food['images'][2], fit: BoxFit.cover),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Text(food['title'], style: TextStyle(fontSize: 40)),
                SizedBox(height: 5),
                Text(
                  '${food['price']} €',
                  style: TextStyle(fontSize: 30, color: Colors.green),
                ),
                SizedBox(height: 10),
                Text(food['description'], textAlign: TextAlign.left),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  addToCart(food);
                },
                child: Text('Añadir a la cesta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}