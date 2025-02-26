import 'package:flutter/material.dart';
import 'package:proyecto_tisoar/views/screens/widget/main_admin/menu_option.dart';

Widget mainAdminBody(BuildContext context) {
  return Stack(
    children: [
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.9,
          height: MediaQuery.of(context).size.width * 1.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(390), bottom: Radius.circular(390)),
              color: Colors.amber),
        ),
      ),
      ListView(
        padding: EdgeInsets.all(40),
        children: [
          SizedBox(height: 150),
          MenuOptionCard( buttonTitle: 'Ver los pedidos pendientes', pageToNavigate: 1),
          SizedBox(height: 100),
          MenuOptionCard( buttonTitle: 'Editar el Menú', pageToNavigate: 2),
          SizedBox(height: 100),
          MenuOptionCard( buttonTitle: 'Editar Bebidas', pageToNavigate:3),
        ],
      )
    ],
  );
}

