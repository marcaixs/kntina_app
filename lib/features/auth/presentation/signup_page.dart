import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kntina_app/features/auth/presentation/login_page.dart';
import 'package:kntina_app/features/shared/widgets/custom_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _formSignupKey = GlobalKey<FormState>();
  String _tel = '';
  String _mail = '';
  String _username = '';
  String _password = '';

  void setSignup() {
    if (_formSignupKey.currentState!.validate()) {
      _formSignupKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Center(
                      child: Image.asset("assets/images/logo.png", width: 200),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Te damos la bienvenida a Kntina',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('Crea tu cuenta!', style: TextStyle(fontSize: 16)),
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 70,
                      child: Icon(Icons.image_not_supported, size: 20),
                    ),
                    Form(
                      key: _formSignupKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Nombre y apellidos',
                            ),
                            validator: (value) => value!.isEmpty
                                ? "Por favor introduce un nombre de usuario"
                                : null,
                            onSaved: (value) => _username = value!,
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Teléfono'),
                            validator: (value) => value!.isEmpty
                                ? "Por favor introduce un teléfono"
                                : null,
                            onSaved: (value) => _tel = value!,
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Correo'),
                            validator: (value) => value!.isEmpty
                                ? "Por favor introduce un correo electrónico"
                                : null,
                            onSaved: (value) => _mail = value!,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                            ),
                            obscureText: true,
                            validator: (value) => value!.isEmpty
                                ? "Por favor introduce una contraseña"
                                : null,
                            onSaved: (value) => _password = value!,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (_) {}),
                    Expanded(child: Text('He leído y acepto los términos y condiciones y la política de privacidad')),
                  ],
                ),
               SizedBox(height: 10,),
                CustomButton(onPressed: () {}, text: 'Crear cuenta'),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('¿Ya tienes cuenta? '),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '¡Entra en Kntina!',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
