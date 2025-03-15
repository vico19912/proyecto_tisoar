import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 690,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.vertical(top: Radius.circular(250), bottom: Radius.circular(250)),
      ),
    );
  }
}
