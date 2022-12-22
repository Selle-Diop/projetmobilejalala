import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/authentification/page_connexion.dart';
import 'package:flutter_application_1/services/authServices.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

import '../home_page_4.dart';

class reset_password extends StatelessWidget {
  const reset_password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/gree.png',
                  width: double.infinity,
                ),
                Positioned(
                  top: 40,
                  left: 7,
                  child: IconButton(
                      onPressed: (() => Get.to(page_connexion())),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 41,
                      )),
                ),
                Positioned(
                  top: 40,
                  left: 120,
                  child: Container(
                    // color: Colors.red,
                    height: 150,
                    margin: const EdgeInsets.only(top: 12),
                    child: Image.asset(
                      'images/logo.png',
                    ),
                  ),
                ),
              ],
            ),
            Card(
              // color: Colors.red,
              // margin: const EdgeInsets.only(top: 1),
              elevation: 6,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              shadowColor: Colors.white,
              child: SizedBox(
                width: 350,
                height: 590,
                child: Container(
                  // color: Colors.red,
                  // margin: EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.all(11.0),
                  child: Column(
                    children: const [
                      formulaire_inscription(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class formulaire_inscription extends StatefulWidget {
  const formulaire_inscription({super.key});

  @override
  State<formulaire_inscription> createState() => _formulaire_inscriptionState();
}

class _formulaire_inscriptionState extends State<formulaire_inscription> {
  // bool isLogin = true;
  // _formulaire_inscriptionState() {
  //   _selectedVal = _lesAbonnees[0];
  // }
  String email = '';

  TextEditingController _textEditingController = TextEditingController();

  bool isEmailCorrcet = false;
  @override
  void dispose() {
    _textEditingController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // isLogin ? page_connexion() : formulaire_inscription();
    return Container(
        child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 6),
            child: Text(
              'Email',
              style: GoogleFonts.roboto(
                  color: const Color(0xFF38385E),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 50,
            width: 264,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: textFormMail(),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print("$email  ");
                FirebaseAuth.instance
                    .sendPasswordResetEmail(email: _textEditingController.text)
                    .then((value) => Get.to(page_connexion()));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF008000),
              padding: const EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              minimumSize: const Size(264, 50),
            ),
            child: Text(
              'Réinitialiser',
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    ));
  }

  TextFormField textFormMail() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _textEditingController,
      showCursor: true,
      onChanged: (value) {
        email = value;
        setState(() {
          isEmailCorrcet = isEmail(value);
        });
      },

      // keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: isEmailCorrcet == false
                      ? Colors.green.shade200
                      : Colors.red.shade200,
                  width: 2),
              borderRadius: BorderRadius.circular(15.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
              borderRadius: BorderRadius.circular(15.0)),
          // border: InputBorder.none,
          hintText: 'Jonh@gmail.com',
          hintStyle: TextStyle(fontSize: 14, color: Color(0xFF9BA2B1))),
      validator: (value) {
        if (isEmailCorrcet == false) {
          if (value == null || value.isEmpty) {
            return 'le champ ne doit pas etre vide';
          }
          return 'verifiez l\'ecriture de votre email';
        }
        return null;
      },
    );
  }
}
