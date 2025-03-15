import 'package:flutter/material.dart';

import 'widget/general/bottom_bar.dart';
import 'widget/main_admin/body.dart';


class MainAdminScreen extends StatelessWidget {
  const MainAdminScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainAdminBody(context),
      bottomNavigationBar: bottomBarAdmin(),
    );
  }
}