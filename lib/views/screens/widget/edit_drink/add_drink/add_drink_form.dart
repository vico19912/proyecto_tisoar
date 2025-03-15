import 'package:flutter/material.dart';

import '../../general/button.dart';
import '../../general/input.dart';


Widget addDrinkForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildInputField("Nombre"),
            buildInputField("Precio"),
            SizedBox(height: 40),
            Center(
              child: CustomButton(text: 'Guardar', onPressed: (){})
            ),
          ],
        ),
      ),
    );
  }