import 'package:flutter/material.dart';
import 'package:kntina_app/core/widgets/back_appbar.dart';
import 'package:kntina_app/features/shared/widgets/custom_button.dart';
import 'package:kntina_app/features/shared/widgets/custom_text_field.dart';

class CheckoutPage extends StatelessWidget {
  final double price;
  const CheckoutPage({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    double shipment = 5;

    return Scaffold(
      appBar: BackAppbar(title: 'Checkout'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('La entrega se realizará en 24-72h'),
            const SizedBox(height: 24),

          
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
                  CustomTextField(
                    label: 'Dirección',
                    icon: Icons.location_on,
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    label: 'Teléfono',
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
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
      child: CustomButton(
        onPressed: () {},
        text: 'Aceptar y pagar',
      ),
    )));
  }
}
