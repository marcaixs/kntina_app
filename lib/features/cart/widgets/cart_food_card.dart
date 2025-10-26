import 'package:flutter/material.dart';

class CartFoodCard extends StatelessWidget {
  final dynamic item;
  final Function(int, int)? updateQuantity;
  final Function(int)? removeItem;

  const CartFoodCard({
    super.key,
    required this.item,
    this.updateQuantity,
    this.removeItem,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '${item['price'].toString()} €',
                      style: TextStyle(fontSize: 10, color: Colors.green),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        if (removeItem != null) {
                          removeItem!(item['id']);
                        }
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 11, 52, 23),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              int currentQuantity = item['quantity'] ?? 1;
                              if (currentQuantity > 1 && updateQuantity != null) {
                                updateQuantity!(item['id'], currentQuantity - 1);
                              }
                            },
                            icon: Icon(Icons.remove, color: Colors.white,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '${item['quantity'] ?? 1}',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              int currentQuantity = item['quantity'] ?? 1;
                              if (updateQuantity != null) {
                                updateQuantity!(item['id'], currentQuantity + 1);
                              }
                            },
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}