import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/domain/models/Role.dart';

class RolesItem extends StatelessWidget {
  Role role;

  RolesItem({
    super.key,
    required this.role
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50),
          height: 100,
          child: FadeInImage(
            placeholder: AssetImage("assets/img/no-photo.jpg"),
            image: NetworkImage(role.image),
            fit: BoxFit.contain,
            fadeInDuration: Duration(seconds: 1),

          ),
        ),
        Text(
          role.name,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black
          ),
        )
      ],
    );
  }
}