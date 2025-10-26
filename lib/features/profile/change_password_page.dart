import 'package:flutter/material.dart';
import 'package:kntina_app/core/widgets/back_appbar.dart';
import 'package:kntina_app/features/shared/widgets/custom_button.dart';
import 'package:kntina_app/features/shared/widgets/custom_text_field.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppbar(title: 'Cambiar contraseña'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: 'Contraseña anterior*',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor introduce tu contraseña actual";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    label: 'Nueva contraseña*',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor introduce una nueva contraseña";
                      }
                  
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    label: 'Confirmar nueva contraseña*',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor confirma tu nueva contraseña";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            CustomButton(onPressed: () {}, text: 'Guardar cambios'),
          ],
        ),
      ),
    );
  }
}
