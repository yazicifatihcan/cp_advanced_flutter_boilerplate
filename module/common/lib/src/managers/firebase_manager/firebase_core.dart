import 'package:firebase_core/firebase_core.dart';

class FirebaseCore {




  Future<void> initialize()async{
    await Firebase.initializeApp();
  }


}