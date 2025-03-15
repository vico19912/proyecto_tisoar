import 'package:flutter/material.dart';
import 'package:proyecto/model/productocliente.dart';
import 'package:proyecto/view/detalle_pedido.dart';
import 'package:proyecto/view/widgets/navigationbar.dart';
import 'package:proyecto/view/widgets/rounded_container.dart';

class BebidasScreen extends StatefulWidget {
  final List<Producto> productos;

  const BebidasScreen({Key? key, required this.productos}) : super(key: key);

  @override
  _BebidasScreenState createState() => _BebidasScreenState();
}

class _BebidasScreenState extends State<BebidasScreen> {
  void _incrementarCantidad(Producto bebida) {
    setState(() {
      bebida.incrementarCantidad();
    });
  }

  void _decrementarCantidad(Producto bebida) {
    setState(() {
      bebida.decrementarCantidad();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          RoundedContainer(),
          Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Bebidas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.productos.length,
                  itemBuilder: (context, index) {
                    final producto = widget.productos[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(producto.nombre),
                          subtitle:
                              Text('L. ${producto.precio.toStringAsFixed(2)}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle,
                                    color: Colors.red),
                                onPressed: () => _decrementarCantidad(producto),
                              ),
                              Text('${producto.cantidad}'),
                              IconButton(
                                icon: const Icon(Icons.add_circle,
                                    color: Colors.green),
                                onPressed: () => _incrementarCantidad(producto),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar a la pantalla de detalle del pedido
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetallePedidoScreen(productos: widget.productos),
                      ),
                    );
                  },
                  child: const Text('Finalizar Bebidas',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        productos: widget.productos,
        currentIndex: 0, // Set the initial index to Menu
        onTap: (index) {
          // Handle the tap event
        },
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
}
