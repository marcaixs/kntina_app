import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:kntina_app/features/auth/presentation/recover_password_page.dart';
import 'package:kntina_app/features/auth/presentation/signup_page.dart';
import 'package:kntina_app/features/home/home_page.dart';
import 'package:kntina_app/features/shared/widgets/custom_button.dart';
import 'package:kntina_app/features/shared/widgets/custom_text_field.dart';

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
      child: Column(
        children: [
          SizedBox(height: 50),
          Image.asset("assets/images/logo.png", width: 200),
          SizedBox(height: 20),
          Text('Nos alegra que estés de vuelta!'),
          SizedBox(height: 20),
          Expanded(
            child: Form(
              key: _formLoginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: 'Correo',
                    icon: Icons.mail,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor introduce un correo electronico";
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                              return "Por favor introduce un correo electrónico válido";
                            }
                      return null;
                    },
                    onSaved: (value) => _mail = value!,
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    label: 'Contraseña',
                    icon: Icons.lock,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor introduce una contraseña";
                      }
                      return null;
                    },
                    onSaved: (value) => _password = value!,
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'He olvidado mi contraseña ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'recuperar',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = goToPassword,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              CustomButton(
                onPressed: setLogin,
                text: 'Iniciar sesión',
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('¿Aún no tienes cuenta? '),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '¡Únete a Kntina!',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()..onTap = goToSignUp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    ),
  ),
);

}}