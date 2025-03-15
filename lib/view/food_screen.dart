import 'package:flutter/material.dart';
import 'package:proyecto/view/widgets/bottom_navbar.dart';
import 'package:proyecto/view/menu_screen.dart';
import 'package:proyecto/view/home_screen.dart';

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('La cantidad mínima es 1')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Óvalo de fondo
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(110),
                  bottomRight: Radius.circular(110),
                ),
              ),
            ),
          ),

          // Título dentro del óvalo
          Positioned(
            top: 110,
            left: MediaQuery.of(context).size.width * 0.25,
            right: MediaQuery.of(context).size.width * 0.25,
            child: Text(
              'Tajaditas',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Imagen dentro del óvalo
          Positioned(
            top: 200,
            left: MediaQuery.of(context).size.width * 0.25,
            right: MediaQuery.of(context).size.width * 0.25,
            child: ClipOval(
              child: Image.asset(
                'assets/tajaditas.jpg', // Asegúrate de que la imagen está en assets
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Contenido principal
          Center(
            child: Container(
              width: 280,
              margin: EdgeInsets.only(top: 220),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          'Carne, ensalada de repollo, encurtido y aderezo',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'L. 30.00',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: decreaseQuantity,
                              child: Icon(Icons.remove, color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor: Colors.red,
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 250, 248, 248),
                              ),
                              child: Text(
                                '$quantity',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: increaseQuantity,
                              child: Icon(Icons.add, color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            print('Pedido finalizado con $quantity unidades');
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Text('Finalizar Comidas'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // Posición de FoodScreen en la navegación
        onTap: (index) {
          if (index == 1) { // Botón de la casa (Home)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 0) { // Botón de los tenedores (Menú)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuScreen()),
            );
          }
        },
      ),
    );
  }
}
