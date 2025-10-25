import 'package:flutter/material.dart';
import 'package:kntina_app/features/profile/change_password_page.dart';
import 'package:kntina_app/features/profile/information_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Image.asset('assets/images/logo.png', height: 25),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 360,
                  height: 360,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile_frame.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: -50,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),

                Positioned(
                  top: 250,
                  left: 0,
                  right: 0,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nombre del Usuario',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              'Nombre del Usuario',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nombre del Usuario',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              'Nombre del Usuario',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Editar perfil'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text('Cambiar contraseña'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ChangePasswordPage()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.gavel),
                    title: Text('Términos y condiciones'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.shield),
                    title: Text('Política de privacidad'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.abc),
                    title: Text('Información'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => InformationPage()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Cerrar sesión'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
