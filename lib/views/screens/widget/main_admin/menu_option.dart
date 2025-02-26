import 'package:flutter/material.dart';
import 'package:proyecto_tisoar/views/screens/edit_drink.dart';
import 'package:proyecto_tisoar/views/screens/edit_menu.dart';
import 'package:proyecto_tisoar/views/screens/pending_orders.dart';

class MenuOptionCard extends StatelessWidget {
  final String buttonTitle;
  final int pageToNavigate;
  const MenuOptionCard(
      {super.key, required this.buttonTitle, required this.pageToNavigate});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => pageNavigation(pageToNavigate, context),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 4,
            padding: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        child: SizedBox(
          height: 90,
          width: 160,
          child: Text(buttonTitle,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
        ));
  }

  void pageNavigation(int pageToNavigate, BuildContext context) {
    switch (pageToNavigate) {
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PendingOrdersScreen();
        }));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditMenuScreen();
        }));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditDrinkScreen();
        }));
        break;
    }
  }
}
