// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screen/authentification/page_connexion.dart';
import 'package:flutter_application_1/services/authServices.dart';

import '../pageAcceuil.dart';

class statutAuth extends StatefulWidget {
  const statutAuth({super.key});

  @override
  State<statutAuth> createState() => _statutAuthState();
}

class _statutAuthState extends State<statutAuth> {
  User? user;
  AuthService _auth = AuthService();
  Future<void> getUser() async {
    final userResult = await _auth.user;
    setState(() {
      user = userResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return page_connexion();
    } else {
      return pageAcceuil();
    }
  }
}
