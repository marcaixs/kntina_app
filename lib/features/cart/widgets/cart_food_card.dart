import 'package:flutter/material.dart';

class CartFoodCard extends StatelessWidget {
  final item;
  const CartFoodCard({super.key, this.item});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 230,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                item['images'][0],
                width: 180,
                height: 230,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: 
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${item['price'].toString()} €',
                          style: TextStyle(fontSize: 10, color: Colors.green),
                        ),
                      ],
                    ),
                  
                    IconButton(icon: Icon(Icons.cancel), onPressed: () {}),
                  ],
                ),
              ),
          ],
        ),
      );
  }
}
