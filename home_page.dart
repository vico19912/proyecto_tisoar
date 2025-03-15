import 'package:flutter/material.dart';
import 'package:proyecto/view/widgets/drawer.dart';
import 'package:proyecto/model/productocliente.dart';
import 'package:proyecto/view/widgets/navigationbar.dart';
import 'package:proyecto/view/widgets/profile_avatar.dart';
import 'package:proyecto/view/widgets/text_card.dart';
import 'package:proyecto/view/detalle_pedido.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicializar la lista de productos
    final List<Producto> productos = [
      Producto(nombre: 'Coca Cola', precio: 30.00),
      Producto(nombre: 'Horchata', precio: 30.00),
      Producto(nombre: 'Jugo Natural', precio: 30.00),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 240, 240),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(color: Colors.white),
            Column(
              children: [
                const SizedBox(height: 50),
                const ProfileAvatar(radius: 50),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextCard(),
                ),
                const SizedBox(height: 100),
                const ProfileAvatar(radius: 50),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        productos: productos,
        currentIndex: 1,
        onTap: (index) {},
        onCarritoPressed: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetallePedidoScreen(productos: productos),
            ),
          );
        },
      ),
    );
  }
}
