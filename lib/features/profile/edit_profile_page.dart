import 'package:flutter/material.dart';
import 'package:kntina_app/core/widgets/back_appbar.dart';
import 'package:kntina_app/features/shared/widgets/custom_button.dart';
import 'package:kntina_app/features/shared/widgets/custom_text_field.dart';
import 'package:kntina_app/user.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    String name = testUser.name;
    String phone = testUser.phone;
    String email = testUser.email;

    void saveProfile() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save(); 
        testUser.name = name;
        testUser.phone = phone;
        testUser.email = email;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Perfil actualizado correctamente')),
        );
      }
    }

    return Scaffold(
      appBar: BackAppbar(title: 'Editar perfil'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            label: 'Nombre y Apellidos',
                            icon: Icons.person,
                     
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor introduce tu nombre y apellidos";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              name = value!;
                            },
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            label: 'Teléfono',
                            icon: Icons.phone,
                            keyboardType: TextInputType.phone,
                       
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor introduce tu número de teléfono";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              phone = value!;
                            },
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            label: 'Correo electrónico',
                            icon: Icons.mail,
                            keyboardType: TextInputType.emailAddress,
                          
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Por favor introduce tu correo electrónico";
                              }
                              if (!value.contains('@') || !value.contains('.')) {
                                return "Por favor introduce un correo electrónico válido";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              email = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomButton(
                onPressed: saveProfile,
                text: 'Guardar cambios',
              ),
            ],
          ),
        ),
      ),
    );
  }
}