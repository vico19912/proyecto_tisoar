import 'package:flutter/material.dart';

import '../general/button.dart';
import '../general/input.dart';
import 'add_food/dropdown.dart';
import 'add_food/text_area.dart';
import 'add_food/upload_image.dart';


Widget addFoodForm() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildInputField("Nombre"),
            buildInputField("Precio"),
            buildDropdownField("Categoría"),
            buildImageUploadField(),
            buildDescriptionField(),
            SizedBox(height: 40),
            Center(
              child: CustomButton(text: 'Guardar', onPressed: (){})
            ),
          ],
        ),
      ),
    );
  }