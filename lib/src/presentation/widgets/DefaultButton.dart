 import 'package:flutter/material.dart';
 class DefaultButton extends StatelessWidget {
   String text;
   VoidCallback onPressed;
   Color backgroundColor;
   Color foregroundColor;
   DefaultButton({
    super.key,
     required this.text,
     required this.onPressed,
     required this.backgroundColor,
     required this.foregroundColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor
        ),
        child: Text(
            text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        )
    );
  }
}
