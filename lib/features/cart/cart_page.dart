import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List cartList;
  const CartPage({super.key, required this.cartList});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
