import 'package:flutter/material.dart';

import 'widget/main_admin/body.dart';

class MainUserBody extends StatelessWidget {
  const MainUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Imagen de fondo
        Positioned.fill(
          child: Image.asset(
            'lib/assets/login.jpg', // Ruta de tu imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        // Container central con el borde redondeado
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // Ajuste del tamaño
            height:
                MediaQuery.of(context).size.height * 0.6, // Ajuste del tamaño
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(390),
                bottom: Radius.circular(390),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  // Card centrada con contenido
                  Center(
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Título centrado con textAlign
                            Text(
                              'Tisoar',
                              textAlign: TextAlign.center, // Centrado de texto
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Script MT',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height: 10), // Espacio entre título y texto
                            // Texto de la card
                            Text(
                              'Lorem ipsum is a dummy text used in laying out print, graphic or web designs. It is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Ciceros De Finibus Bonorum et Malorum for use in a type specimen book',
                              style: TextStyle(fontSize: 18),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                              child: Text('ver menu admin'),
                              onTap: () => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => mainAdminBody(context)) )
                              },
                            )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
