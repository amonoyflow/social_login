import 'package:flutter/material.dart';

class LoginSocialMedia extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function onPress;

  const LoginSocialMedia({
    Key key,
    this.icon,
    this.color,
    this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}