import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String title;

  const MenuButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 130,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 28),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
