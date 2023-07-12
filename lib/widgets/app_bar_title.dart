import 'package:flutter/material.dart';


class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/firebase_logo.png',
          height: 20,
        ),
        SizedBox(width: 8),
        Text(
          'FlutterFire',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          ' Authentication',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
