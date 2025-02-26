import 'package:flutter/material.dart';

class RowOrder extends StatelessWidget {
  final String foodName;
  final int quantity;
  final int idFood;

  const RowOrder({super.key, required this.foodName, required this.quantity, required this.idFood});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              foodName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              quantity.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.add_circle, size: 30),
          ],
        ),
      ),
    );
  }
}
