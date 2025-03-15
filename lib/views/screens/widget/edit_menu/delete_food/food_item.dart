import 'package:flutter/material.dart';

Widget foodItem( {required String name}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffd9d9d9)),
        ),
        trailing: Icon(Icons.delete, color: Colors.red),
      ),
    ),
  );
}
