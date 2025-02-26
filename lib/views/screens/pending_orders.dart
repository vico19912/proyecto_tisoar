import 'package:flutter/material.dart';
import 'package:proyecto_tisoar/views/screens/widget/general/bottom_bar.dart';
import 'package:proyecto_tisoar/views/screens/widget/pending_orders/row_order.dart';

class PendingOrdersScreen extends StatelessWidget {
  const PendingOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 90,
              ),
              Text(
                'Pedidos Pendientes',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ]),
            ListView(
              padding: EdgeInsets.all(40),
              children: [
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Pedido",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "Cantidad",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text('Despachar', style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)
                    )
                  ],
                ),
                Divider(color: Colors.black, thickness: 2),
                SizedBox(height: 20),
                RowOrder(foodName: 'Tajaditas', quantity: 50, idFood: 1),
                SizedBox(height: 20),
                RowOrder(foodName: 'Pastelitos', quantity: 22, idFood: 2),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomBarAdmin(),
    );
  }
}
