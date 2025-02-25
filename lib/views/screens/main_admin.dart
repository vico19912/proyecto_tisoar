import 'package:flutter/material.dart';
import 'package:proyecto_tisoar/views/screens/widget/main_admin/body.dart';
import 'package:proyecto_tisoar/views/screens/widget/main_admin/bottom_bar.dart';

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