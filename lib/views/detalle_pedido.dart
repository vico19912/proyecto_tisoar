import 'package:flutter/material.dart';
import 'package:proyecto/model/productocliente.dart';
import 'package:proyecto/view/widgets/navigationbar.dart';
import 'package:proyecto/view/widgets/rounded_container.dart';

class DetallePedidoScreen extends StatefulWidget {
  final List<Producto> productos;

  const DetallePedidoScreen({Key? key, required this.productos})
      : super(key: key);

  @override
  _DetallePedidoScreenState createState() => _DetallePedidoScreenState();
}

class _DetallePedidoScreenState extends State<DetallePedidoScreen> {
  void _cancelarPedido() {
    setState(() {
      for (var producto in widget.productos) {
        producto.cantidad = 0;
      }
    });
  }

  void _eliminarProducto(Producto producto) {
    setState(() {
      producto.cantidad = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = widget.productos
        .fold(0, (sum, item) => sum + (item.precio * item.cantidad));
    bool hayProductos =
        widget.productos.any((producto) => producto.cantidad > 0);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          RoundedContainer(),
          Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Detalle del pedido',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Descripción',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Cantidad',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Precio',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.productos.length,
                    itemBuilder: (context, index) {
                      return widget.productos[index].cantidad > 0
                          ? ProductoItem(
                              producto: widget.productos[index],
                              eliminarProducto: _eliminarProducto,
                            )
                          : Container();
                    }),
              ),
              if (hayProductos) ...[
                const Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total a Pagar:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'L. ${total.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: _cancelarPedido,
                          child: const Text(
                            'Cancelar Pedido',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            // Lógica para realizar pedido (en blanco por ahora)
                          },
                          child: const Text(
                            'Realizar Pedido',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        productos: widget.productos,
        currentIndex: 2, // Set the initial index to Carrito
        onTap: (index) {
          // Handle the tap event
        },
        onCarritoPressed: (context) {
          Navigator.pushReplacement(
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

class ProductoItem extends StatelessWidget {
  final Producto producto;
  final Function(Producto) eliminarProducto;

  const ProductoItem(
      {Key? key, required this.producto, required this.eliminarProducto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(producto.nombre),
            ),
            Expanded(
              child: Text(
                '${producto.cantidad}',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                'L. ${producto.precio.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => eliminarProducto(producto),
            ),
          ],
        ),
      ),
    );
  }
}
