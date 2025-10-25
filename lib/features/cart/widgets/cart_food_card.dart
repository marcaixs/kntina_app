import 'package:flutter/material.dart';

class CartFoodCard extends StatelessWidget {
  final item;
  const CartFoodCard({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.network(item['images'][0],  width: 100,
  height: 100, fit: BoxFit.cover),
          Column(
            children: [
              Text(item['title']),
              Text(item['price'].toString()),
              Row(
                children: [
                  IconButton(icon: Icon(Icons.cancel), onPressed: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
