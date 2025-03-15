import 'package:flutter/material.dart';

import 'widget/edit_drink/edit_drik_body.dart';
import 'widget/general/bottom_bar.dart';


class EditDrinkScreen extends StatelessWidget {
  const EditDrinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyEditDrink(context),
      bottomNavigationBar: bottomBarAdmin(),
    );
  }
}