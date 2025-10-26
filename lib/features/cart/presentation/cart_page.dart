import 'package:flutter/material.dart';
import 'package:kntina_app/features/cart/presentation/checkout_page.dart';
import 'package:kntina_app/features/cart/widgets/cart_list.dart';
import 'package:kntina_app/features/shared/widgets/custom_button.dart';

class CartPage extends StatefulWidget {
  final List cartList;
  final Function(int, int)? updateQuantity;
  final Function(int)? removeItem;

  const CartPage({
    super.key,
    required this.cartList,
    this.updateQuantity,
    this.removeItem,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get subtotal {
    double sum = 0;
    for (var item in widget.cartList) {
      double price = (item['price'] ?? 0).toDouble();
      int quantity = item['quantity'] ?? 1;
      sum += price * quantity;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: CartList(
              cartList: widget.cartList,
              updateQuantity: widget.updateQuantity,
              removeItem: widget.removeItem,
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${subtotal.toStringAsFixed(2)} €',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
          SizedBox(height: 50),
          SizedBox(
            child: CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CheckoutPage(price: subtotal),
                  ),
                );
              },
              text: 'Checkout',
            ),
          ),
        ],
      ),
    );
  }
}