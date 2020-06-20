import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_login/ui/widgets/textfield_container.dart';

class LoginPassword extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  
  const LoginPassword({
    Key key,
    this.hintText,
    this.icon = Icons.lock,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
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