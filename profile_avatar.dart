import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;

  const ProfileAvatar({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.shade300,
    );
  }
}
