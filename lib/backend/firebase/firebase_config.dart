import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCGCohbuwjYXaFlE-eIMgTVunFAMcoxV6k",
            authDomain: "codeex-73f7c.firebaseapp.com",
            projectId: "codeex-73f7c",
            storageBucket: "codeex-73f7c.appspot.com",
            messagingSenderId: "838055659298",
            appId: "1:838055659298:web:bc4029eda41a2a8446c77b",
            measurementId: "G-2RM8Q61P4Q"));
  } else {
    await Firebase.initializeApp();
  }
}
