import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'helpers/localStore.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String? name,email,imageUrl;

Future<String> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    UserCredential authResult = await _auth.signInWithCredential(credential);
    User? user = authResult.user;
    
    // Checking if email and name is null
    assert(user!.email != null);
    assert(user!.displayName != null);
    assert(user!.photoURL != null);

    name = user!.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    // Only taking the first part of the name, i.e., First Name
    if (name!.contains(" ")) {
      name = name!.substring(0, name!.indexOf(" "));
    }

    assert(!user.isAnonymous);
   // assert(await user.getIdToken() != null);

    // Toto implement shared preferences to store data about login
    addSignInDetailstoSF(name!, email, imageUrl);
    return 'signInWithGoogle succeeded: $user';
  } catch (e) {
    print(e);
  }
  return "failure";
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  await removeAll();
  print("User Sign Out");
}
