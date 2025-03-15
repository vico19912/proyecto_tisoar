import 'package:flutter/material.dart';

import 'menu_option.dart';

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
              color:  Color(0xffd9d9d9)),
        ),
      ),
      ListView(
        padding: EdgeInsets.all(40),
        children: [
          SizedBox(height: 100),
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

