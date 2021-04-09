import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


/*class AuthController {


  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthController();

//В этом signInWithGoogle методе мы должны использовать данные входа в Google для
// аутентификации, FirebaseUser а затем вернуть этого пользователя.

  Future <String> signInWithGoogle() async {

    //await Firebase.initializeApp();

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,);

    final UserCredential authResult = await _auth.signInWithCredential(
        credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return '$user';
    }
    /*final User user = ( await _auth.signInWithCredential(credential)).user;
    print('signed in'+ user.displayName );
     return user;*/
    return null;
  }

  //В этом signOutGoogle методе нам нужно просто выйти из текущей учетной записи
// Google.
  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();

    print("User Signed Out");
  }

}*/
