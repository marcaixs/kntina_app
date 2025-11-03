import 'package:flutter/material.dart';
import 'package:kntina_app/features/orders/widgets/order_list_rows.dart';

class OrdersPage extends StatelessWidget {
  final List orderList;

  const OrdersPage({super.key, required this.orderList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderList.length,
      itemBuilder: (BuildContext context, int index) {
        return OrderListRows(order: orderList[index]);
      },
    );
  }
}
