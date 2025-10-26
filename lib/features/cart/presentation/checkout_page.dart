import 'package:flutter/material.dart';
import 'package:kntina_app/features/shared/widgets/back_appbar.dart';
import 'package:kntina_app/features/shared/widgets/custom_button.dart';
import 'package:kntina_app/features/shared/widgets/custom_text_field.dart';

class CheckoutPage extends StatelessWidget {
  final double price;
  final List? cartList;
  final VoidCallback? completeOrder;
  const CheckoutPage({
    super.key,
    required this.price,
    this.cartList,
    this.completeOrder,
  });

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
                const Text('Total'),
                Text('${(price + shipment).toStringAsFixed(2)} €'),
              ],
            ),

            const SizedBox(height: 32),

            Form(
              child: Column(
                children: [
                  CustomTextField(
                    label: 'Dirección',
                    icon: Icons.location_on,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor introduce una dirección de entrega";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    label: 'Teléfono',
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor introduce un teléfono de contacto";
                      }
                      return null;
                    },
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
            onPressed: () {
              if (completeOrder != null) {
                completeOrder!();
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Pedido realizado con éxito')),
              );
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            text: 'Aceptar y pagar',
          ),
        ),
      ),
    );
  }
}