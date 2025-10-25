import 'package:flutter/material.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(child: Image.asset('assets/images/logo.png', height: 25)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 70),
            Stack(
              clipBehavior: Clip.none,
              children: [
          
                Container(
                  width: 380,
                  height: 380,
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
          ],
        ),
      ),
    );
  }
}
