import 'package:flutter/material.dart';
import 'package:kntina_app/core/widgets/back_appbar.dart';
import 'package:kntina_app/features/shared/widgets/custom_button.dart';
import 'package:kntina_app/features/shared/widgets/custom_text_field.dart';

class RecoverPasswordPage extends StatelessWidget {
  const RecoverPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(title: 'Recuperar contraseña'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 100),
                Image(image: AssetImage("assets/images/logo.png"), width: 200),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: CustomTextField(
                    label: 'Correo',
                    icon: Icons.mail,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor introduce un correo electronico";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
           
            Column(
              children: [
                CustomButton(onPressed: () {}, text: 'Enviar'),
                SizedBox(height: 20,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
