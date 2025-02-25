import 'package:flutter/material.dart';

Widget mainAdminBody(BuildContext context) {
  return Stack(
    children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 1.9,
            height: MediaQuery.of(context).size.width * 1.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(390),
                bottom: Radius.circular(390)
              ),
              color: Colors.amber
            ),
          ),
        ),
      ListView(
        children: [
          Card(
            child: Text('Ver los pedidos pendientes'),
          ),
          Card(
            child: Text('Editar Menú'),
          ),
          Card(
            child: Text('Editar Bebidas'),
          ),
        ],
      )
    ],
  );
}
