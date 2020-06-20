import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name;
String email;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = 
    await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.idToken, 
    accessToken: googleSignInAuthentication.accessToken
  );
  
  final AuthResult authResult = await auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  name = user.displayName;
  email = user.email;

  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  final FirebaseUser currentUser = await auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();
}