import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/Pages/NavBar.dart';
import 'package:flutter_application_project_3/Pages/SignIn.dart';
import 'package:flutter_application_project_3/moduls/Cart.dart';
import 'package:flutter_application_project_3/moduls/UserC.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        setUser(user);
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
      setState(() {});
    });
  }

  setUser(User? u) async {
    final userCollection = await FirebaseFirestore.instance.collection('user').get();
    for (final doc in userCollection.docs) {
      if (doc.id == u!.email) {
        Cart.user = UserC.fromMap(doc.data());
      }
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn
          ? NavBar(
              currentIndex: 0,
              secondePage: 0,
              restaurantId: 0,
            )
          : const SignIn(),
      title: 'ToYou',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
