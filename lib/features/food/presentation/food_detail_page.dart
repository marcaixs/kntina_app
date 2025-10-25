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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 600,
                      child: PageView(
                        children: [
                          Image.network(food['images'][0], fit: BoxFit.cover),
                          Image.network(food['images'][1], fit: BoxFit.cover),
                          Image.network(food['images'][2], fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food['title'], style: TextStyle(fontSize: 40)),
                      Text(
                        food['price'].toString(),
                        style: TextStyle(fontSize: 30, color: Colors.green),
                      ),
                    ],
                  ),

                  Text(food['description'], textAlign: TextAlign.justify,),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  addToCart(food);
                },
                child: Text('Añadir a la cesta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
