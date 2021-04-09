import 'package:firebase_auth/firebase_auth.dart';
// Проверка валидации строк
Future<bool> singIn(String email, String password) async{

  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;

  }catch(e){
    print(e);
    return false;
  }
}
Future<bool> register(String email, String password) async{

  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return true;

  }on FirebaseAuthException catch(e){
    if (e.code=='weak-password'){
      print('1');
    }
    else if(e.code =='email-'){
      print('2');
    }
    return false;
  }catch(e) {
    print('3');
    return false;
  }
  }
