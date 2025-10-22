import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  const FoodCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(image, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text(name), Text('$price €')],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
