import 'package:flutter/material.dart';

import 'widget/edit_menu/edit_menu_body.dart';
import 'widget/general/bottom_bar.dart';


class EditMenuScreen extends StatelessWidget {
  const EditMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyMenuEdit(),
      bottomNavigationBar: bottomBarAdmin(),
    );
  }
}