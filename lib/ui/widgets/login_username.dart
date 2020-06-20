import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_login/ui/widgets/textfield_container.dart';

class LoginUsername extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  
  const LoginUsername({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}