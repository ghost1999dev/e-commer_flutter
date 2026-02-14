
import 'package:flutter/material.dart';
class DefaultTextField extends StatelessWidget {
  String label;
  IconData icon;
  Function(String value) onChange;
  bool obscureText;
  bool isNumber;

   DefaultTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.onChange,
    required this.obscureText,
    required this.isNumber
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
        onChange(value);
      },
      obscureText: obscureText ? true:false,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        )
      ),
    );
  }
}
