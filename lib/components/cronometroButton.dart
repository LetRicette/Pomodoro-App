import 'package:flutter/material.dart';

class CronometroButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const CronometroButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          textStyle: TextStyle(
            fontSize: 25,
          ),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Text(text),
          ],
        ));
  }
}
