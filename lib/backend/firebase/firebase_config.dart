import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD1pui2pXaHAwKZx4g8EgcrajUk5J69AI8",
            authDomain: "hotel-dunamys-ay9x21.firebaseapp.com",
            projectId: "hotel-dunamys-ay9x21",
            storageBucket: "hotel-dunamys-ay9x21.firebasestorage.app",
            messagingSenderId: "1005245374810",
            appId: "1:1005245374810:web:e42a38a63589445da99363"));
  } else {
    await Firebase.initializeApp();
  }
}
