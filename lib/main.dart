import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/screen/pageAcceuil.dart';
import 'package:flutter_application_1/services/authServices.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'screen/home_page_1.dart';
import 'screen/home_page_2.dart';
import 'screen/home_page_3.dart';
import 'screen/home_page_4.dart';
import 'screen/authentification/page_connexion.dart';
import 'screen/authentification/page_inscription.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AuthService deter = AuthService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/home',
      getPages: appRoutes(),
      home: const MyMainpage(),
    );
  }
}

class MyMainpage extends StatelessWidget {
  const MyMainpage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const pageAcceuil();
            } else {
              return page_connexion();
            }
          }));
}
