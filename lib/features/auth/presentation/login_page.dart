import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:kntina_app/features/auth/presentation/recover_password_page.dart';
import 'package:kntina_app/features/auth/presentation/signup_page.dart';
import 'package:kntina_app/features/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  String _mail = '';
  String _password = '';

  void setLogin() {
    // si les dades introduides per l'usuari conicideixen, ruta a la main page
    if (_formLoginKey.currentState!.validate()) {
      _formLoginKey.currentState!.save();
      {
        goToMainPage();
      }
    }
  }

  // ruta a la main page
  void goToMainPage() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (context) => const HomePage()));
  }

  // ruta a signup
  void goToSignUp() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (context) => const SignupPage()));
  }

  void goToPassword() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => const RecoverPasswordPage(),
      ),
    );
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 100),
                  Image(image: AssetImage("assets/images/logo.png"), width: 200),
                  SizedBox(height: 50),
                  Text('Nos alegra que estés de vuelta!'),
                  Form(
                    key: _formLoginKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(label: Text('Correo')),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor introduce un correo electronico";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _mail = value!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(label: Text('Contraseña')),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor introduce una contraseña";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                        SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'He olvidado mi contraseña ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'recuperar',
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = goToPassword,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  ElevatedButton(
                    onPressed: setLogin,
                    child: Text('Iniciar sesión'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('¿Aún no tienes cuenta?'),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '¡Únete a Kntina!',
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = goToSignUp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}}