import 'package:flutter/material.dart';

import '../general/button.dart';
import 'delete_food/food_item.dart';


Widget deleteFoodList() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: ListView(children: [
      foodItem(name: 'Tajaditas'),
      foodItem(name: 'Yuca Frita'),
      foodItem(name: 'Enchiladas'),
      SizedBox(height: 20),
      CustomButton(text: 'Finalizar', onPressed: () {})
    ]),
  );
}
