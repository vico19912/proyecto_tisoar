import 'package:flutter/material.dart';
import 'package:proyecto/view/bebidascreen.dart';
import 'package:proyecto/view/widgets/navigationbar.dart';
import 'package:proyecto/model/productocliente.dart';
import 'package:proyecto/view/home_page.dart';
import 'package:proyecto/view/detalle_pedido.dart';

class MenuScreen extends StatefulWidget {
  final List<Producto> productos;

  const MenuScreen({Key? key, required this.productos}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 450,
              height: 690,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(250), bottom: Radius.circular(250)),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMenuButton('Menú de Desayunos'),
                SizedBox(height: 20),
                _buildMenuButton('Menú de Almuerzos'),
                SizedBox(height: 20),
                _buildMenuButton('Otras Especialidades'),
                SizedBox(height: 20),
                _buildMenuButton('Bebidas', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BebidasScreen(productos: widget.productos),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        productos: widget.productos,
        currentIndex: _currentIndex,
        onTap: _onNavBarTap,
        onCarritoPressed: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetallePedidoScreen(productos: widget.productos),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuButton(String title, [VoidCallback? onPressed]) {
    return SizedBox(
      width: 250,
      height: 130,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          title,
          style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0), fontSize: 28),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
