import 'package:flutter/material.dart';
import 'package:kntina_app/features/orders/widgets/order_list_rows.dart';

class OrdersPage extends StatefulWidget {
  final List orderList;
  const OrdersPage({super.key, required this.orderList});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.orderList.length,
      itemBuilder: (BuildContext context, int index) {
        return OrderListRows(order: widget.orderList[index],);
      },
    );
  }
}
