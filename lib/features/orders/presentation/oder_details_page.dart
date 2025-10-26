import 'package:flutter/material.dart';
import 'package:kntina_app/core/widgets/back_appbar.dart';
import 'package:kntina_app/features/food/widgets/food_grid.dart';

class OrderDetailsPage extends StatelessWidget {
  final Map order;
  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(title: 'Pedido ${order['id']}'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(order['date']),
          SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('${order['price']} €', style: TextStyle(color: Colors.green),), Text(order['status'])],),
            SizedBox(height: 16),
          Expanded(child: FoodGrid(foodList: order['products']))
        ],),
      )
    );
  }
}