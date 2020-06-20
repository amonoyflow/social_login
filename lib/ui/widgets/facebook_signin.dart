import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:social_login/models/login.dart';

final FacebookLogin facebookLogin = FacebookLogin();
String fname;
String femail;
String imageUrl;

Future<FacebookLoginResult> signInWithFacebook() async {
  FacebookLoginResult facebookLoginResult = 
    await facebookLogin.logIn(["email"]);
    Client http = Client();
    var response = await http.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult.accessToken.token}');
    var jsonR = LoginModel.fromJson(json.decode(response.body));
    fname = jsonR.name;
    femail = jsonR.email;
    print(jsonR.toString());
  return facebookLoginResult;
}

void signOutFacebook() async {
  facebookLogin.logOut();
}