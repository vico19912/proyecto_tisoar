import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -40,
          top: 30,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
          ),
        ),
        Positioned(
          right: -40,
          top: 30,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                'Tisoar',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive',
                  color: Colors.black, 
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Lorem ipsum has been the industry\'s simply dummy text of the printing and typesetting industry. Lorem ipsum is a placeholder text commonly used in publishing and graphic design to demonstrate the visual form of a document or a typeface without relying on meaningful content. It is a Lorem ipsum is a placeholder text commonly used in publishing and graphic design to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black, 
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
