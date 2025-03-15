import 'package:flutter/material.dart';

import '../../edit_menu/delete_food/food_item.dart';
import '../../general/button.dart';


Widget deleteDrinkList() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: ListView(children: [
      foodItem(name: 'Horchat'),
      foodItem(name: 'Jugo de Naranja'),
      foodItem(name: 'Coca Cola'),
      SizedBox(height: 20),
      CustomButton(text: 'Finalizar', onPressed: () {})
    ]),
  );
}
