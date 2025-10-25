import 'package:flutter/material.dart';
import 'package:kntina_app/core/widgets/back_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppbar(title: 'Información'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/info.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/logo.png', height: 50,),
                SizedBox(height: 20,),
                Text('ver. 1.0'),
                SizedBox(height: 20,),
                Text(
                  'En Kntina, queremos que tu experiencia en la cocina sea simple, deliciosa y llena de estilo. Por eso, combinamos lomejor de dos mundos: platos preparados listos para difrutar y una seleccion de utensilios y menaje que harán que tu cocina destaque.\n\nYa sea que estés buscando una comida rápida y sabrosa o los accesorios perfectos para darle un toque único a tus recetas, en Kntina lo contrarás todo. Nuestra misión es que disfrutes cada momento, desde la preparación hasta el último bocado. Aquí no solo comes, aquí transformas tu cocina en un espacio donde el buen gusto se une a la funcionalidad.',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(FontAwesomeIcons.facebook, color: Colors.green),
                    SizedBox(width: 20),
                    FaIcon(FontAwesomeIcons.envelope, color: Colors.green),
                    SizedBox(width: 20),
                    FaIcon(FontAwesomeIcons.xTwitter, color: Colors.green),
                    SizedBox(width: 20),
                    FaIcon(FontAwesomeIcons.instagram, color: Colors.green),
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
