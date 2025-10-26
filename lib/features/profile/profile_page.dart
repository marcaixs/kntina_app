import 'package:flutter/material.dart';
import 'package:kntina_app/features/profile/change_password_page.dart';
import 'package:kntina_app/features/profile/edit_profile_page.dart';
import 'package:kntina_app/features/profile/information_page.dart';
import 'package:kntina_app/features/profile/widgets/profile_list_item.dart';
import 'package:kntina_app/user.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 380,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile_frame.png'),
                        fit: BoxFit.fill,
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
                    top: 240,
                    left: 0,
                    right: 0,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.mail, color: Colors.green),
                                    SizedBox(width: 10),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        'CORREO',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  testUser.email,
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.phone, color: Colors.green),
                                    SizedBox(width: 10),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 2,
                                        ),
                                      ),
                                      child: Text(
                                        'CONTACTO',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  testUser.phone,
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileListItem(
                      icon: Icons.edit,
                      title: 'Editar perfil',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => EditProfilePage()),
                        );
                      },
                    ),
                    ProfileListItem(
                      icon: Icons.lock,
                      title: 'Cambiar contraseña',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChangePasswordPage(),
                          ),
                        );
                      },
                    ),
                    ProfileListItem(
                      icon: Icons.gavel,
                      title: 'Términos y condiciones',
                    ),
                    ProfileListItem(
                      icon: Icons.shield,
                      title: 'Política de privacidad',
                    ),
                    ProfileListItem(
                      imageIcon: ImageIcon(AssetImage('assets/images/icon.png')),
                      title: 'Información',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => InformationPage()),
                        );
                      },
                    ),
                    ProfileListItem(
                      icon: Icons.logout,
                      title: 'Cerrar sesión',
                      showDivider: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
