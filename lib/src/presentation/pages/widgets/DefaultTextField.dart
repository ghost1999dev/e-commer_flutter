
import 'package:flutter/material.dart';
class DefaultTextField extends StatelessWidget {
  String label;
  IconData icon;
  Function(String value) onChange;
  bool obscureText;
  String?Function(String?)? validator;
  bool isNumber;

   DefaultTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.onChange,
    required this.obscureText,
    this.validator,
    required this.isNumber
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value){
        onChange(value);
      },
      validator: validator,
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
