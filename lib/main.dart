import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/routes.dart';
import 'package:flutter_application_1/screen/pageAcceuil.dart';
import 'package:flutter_application_1/services/authServices.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
// import 'screen/home_page_1.dart';
// import 'screen/home_page_2.dart';
// import 'screen/home_page_3.dart';
// import 'screen/home_page_4.dart';
import 'screen/authentification/page_connexion.dart';
import 'screen/authentification/page_inscription.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'jalalaMaps',
      options: FirebaseOptions(
        apiKey: "AIzaSyD1RaFEs3B2s2GqbDM4qJ5faIJDwCrm9gc",
        // authDomain: "jalalamaps-374f0.firebaseapp.com",
        projectId: "jalalamaps-374f0",
        storageBucket: "jalalamaps-374f0.appspot.com",
        messagingSenderId: "408054532495",
        appId: "1:408054532495:web:b4dacde5664d51ad4aa3fa",
      ));

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
      builder: EasyLoading.init(),

      // theme: ThemeData(
      //   primarySwatch: Colors.green,
      // ),
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
