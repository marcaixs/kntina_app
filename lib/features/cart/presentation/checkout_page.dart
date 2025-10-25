import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final double price;
  const CheckoutPage({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    double shipment = 5;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Checkout'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('La entrega se realizará en 24-72h'),
            const SizedBox(height: 24),

            // 🧾 Resumen de precios
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal'),
                Text('${price.toStringAsFixed(2)} €'),
              ],
            ),
            const Divider(height: 32),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Gastos de envío'),
                Text('${shipment.toStringAsFixed(2)} €'),
              ],
            ),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                 
                ),
                Text(
                  '${(price + shipment).toStringAsFixed(2)} €',
                ),
              ],
            ),

            const SizedBox(height: 32),

            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Dirección'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Telefono'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    bottomNavigationBar: Padding(
    padding: const EdgeInsets.all(20.0),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Aceptar y pagar'),
      ),
    )));
  }
}
