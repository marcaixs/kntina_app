import 'package:flutter/material.dart';
import 'package:kntina_app/core/widgets/back_appbar.dart';

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
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: 'Contraseña anterior*',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
            
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: 'Nueva contraseña*',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
            
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      labelText: 'Confirmar nueva contraseña*',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(250, 30),
              backgroundColor: Colors.green
            ),
            child: Text('Guardar cambios'),
          ),
          ],
        ),
      ),
    
        
        );
  
  }
}
