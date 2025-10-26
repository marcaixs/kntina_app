import 'package:flutter/material.dart';
import 'package:kntina_app/features/cart/presentation/checkout_page.dart';
import 'package:kntina_app/features/cart/widgets/cart_list.dart';

class CartPage extends StatefulWidget {
  final List cartList;
  const CartPage({super.key, required this.cartList});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get subtotal {
    double sum = 0;
    for (var item in widget.cartList) {
      sum += (item['price'] ?? 0).toDouble();
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child: CartList(cartList: widget.cartList)),
          Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('Subtotal'),
            Text('${subtotal.toStringAsFixed(2)} €')
          ],),
        Container(
          height: 100,
          child: ElevatedButton(onPressed: (){
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CheckoutPage(price: subtotal),
                    ),
                  );
          }, child: Text('Checkout')),
        )],
      ),
    );
  }
}
