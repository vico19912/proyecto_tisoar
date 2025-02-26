import 'package:flutter/material.dart';

Widget bottomBarAdmin() {
  return BottomAppBar(
      shape: CircularNotchedRectangle(), 
      color: Colors.amber, // Color de fondo de la barra
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.local_dining_rounded),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () => {print('Hola')},
          ), // Espacio para el botón flotante
          IconButton(
            icon: Icon(Icons.fact_check_sharp),
            onPressed: () => {},
          ),
          IconButton(onPressed: () => {}, icon: Icon(Icons.local_drink_rounded))
        ],
      ));
}
