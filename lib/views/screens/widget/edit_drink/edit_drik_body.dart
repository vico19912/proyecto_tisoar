import 'package:flutter/material.dart';

import 'add_drink/add_drink_form.dart';
import 'delete_drink/delete_drink_form.dart';

Widget bodyEditDrink(BuildContext context) {
  return Stack(
    children: [
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.9,
          height: MediaQuery.of(context).size.width * 1.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(390), bottom: Radius.circular(390)),
              color:  Color(0xffd9d9d9)),
        ),
      ),
      DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tabs: [
                          Tab(text: "Agregar Bebida"),
                          Tab(text: "Eliminar Bebida"),
                        ],
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Center(child: addDrinkForm()),
                            Center(child: deleteDrinkList()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    ],
  );
}

