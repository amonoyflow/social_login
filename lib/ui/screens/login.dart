import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:social_login/constants/assets.dart';
import 'package:social_login/constants/social_login_icons.dart';
import 'package:social_login/ui/screens/home.dart';
import 'package:social_login/ui/widgets/facebook_signin.dart';
import 'package:social_login/ui/widgets/google_signing.dart';
import 'package:social_login/ui/widgets/login_username.dart';
import 'package:social_login/ui/widgets/login_password.dart';
import 'package:social_login/ui/widgets/login_button.dart';
import 'package:social_login/ui/widgets/login_socialmedia.dart';
import 'package:social_login/ui/widgets/login_divider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double _sigmaX = 5.0;
  double _sigmaY = 5.0;
  double _opacity = 0.7;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.bgLogin),
                fit: BoxFit.cover
              )
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
              child: Container(
                color: Colors.black87.withOpacity(_opacity),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(SLIcons.fingerprint, size: 200, color: Colors.white),
                  ),
                  SizedBox(height: 50),
                  LoginUsername(
                    hintText: "Username",
                    icon: Icons.person,
                  ),
                  LoginPassword(
                    hintText: "Password",
                    icon: Icons.lock,
                  ),
                  LoginButton(
                    text: "LOGIN",
                    onPress: (){},
                  ),
                  LoginDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LoginSocialMedia(
                        icon: SLIcons.google,
                        color: Color(0xFF4885ED),
                        onPress: () {
                          signInWithGoogle().whenComplete(() => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Home();
                                }
                              ),
                            ),
                          });
                        },
                      ),
                      LoginSocialMedia(
                        icon: SLIcons.facebook,
                        color: Color(0xFF3B5998),
                        onPress: () {
                          signInWithFacebook().whenComplete(() => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Home();
                                }
                              ),
                            ),
                          });
                        },
                      ),
                      LoginSocialMedia(
                        icon: SLIcons.linkedin,
                        color: Color(0xFF0E76A8),
                        onPress: (){},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}