import 'package:flutter/material.dart';

Widget buildImageUploadField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Cargar Imagen", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text("Seleccionar imagen"),
            trailing: Icon(Icons.image, color: Colors.grey),
            onTap: () {},
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }