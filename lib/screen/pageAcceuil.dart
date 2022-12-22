import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/authServices.dart';

class pageAcceuil extends StatefulWidget {
  const pageAcceuil({super.key});

  @override
  State<pageAcceuil> createState() => _pageAcceuilState();
}

class _pageAcceuilState extends State<pageAcceuil> {
  // User? user;
  // AuthService _auth = AuthService();
  // Future<void> getUser() async {
  //   final userResult = await _auth.user;
  //   setState(() {
  //     user = userResult;
  //   });
  // }
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text('Bienvenue a la page acceuil'),
            ),
          ),
          Text('Bienvenue  ${user?.email}')
        ],
      ),
    );
  }
}
