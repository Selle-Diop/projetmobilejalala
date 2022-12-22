import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/authentification/page_connexion.dart';
import 'package:flutter_application_1/screen/pageAcceuil.dart';
import 'package:flutter_application_1/services/authServices.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

import '../home_page_4.dart';

class page_inscription extends StatelessWidget {
  const page_inscription({super.key});

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
                      onPressed: (() => Get.to(connexion_inscription())),
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
  String nomComplet = '';
  String password = '';
  String confirmPassword = '';
  final AuthService _authService = AuthService();
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingPassword = TextEditingController();

  bool isEmailCorrcet = false;
  @override
  void dispose() {
    _textEditingController.dispose();
    _textEditingPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final _lesAbonnees = ["ménages", "Agent de ramassage", "Agent de JalalaMaps"];
  String? _selectedVal;
  @override
  Widget build(BuildContext context) {
    // isLogin ? page_connexion() : formulaire_inscription();
    return Container(
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    child: Text(
                      'Nom Complet',
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
                        child: textform(),
                      )),
                ],
              ),
              const SizedBox(
                height: 13.0,
              ),
              Column(
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
                ],
              ),
              const SizedBox(
                height: 13.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    child: Text(
                      'Type d\'abonnement',
                      style: GoogleFonts.roboto(
                          color: const Color(0xFF38385E),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    height: 56,
                    width: 264,
                    // padding: EdgeInsets.only(left: 8),

                    padding: EdgeInsets.only(right: 2, left: 2, top: 1),
                    child: DropdownButtonFormField(
                      // dropdownColor: Colors.green,
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: Colors.green,
                      ),
                      hint: const Text(
                        'Choissisez votre abonnement',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF9BA2B1)),
                      ),
                      value: _selectedVal,
                      items: _lesAbonnees
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          _selectedVal = val as String;
                        });
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green.shade200, width: 2),
                              borderRadius: BorderRadius.circular(15.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2),
                              borderRadius: BorderRadius.circular(15.0)),
                          border: InputBorder.none,
                          hintStyle: const TextStyle(
                              fontSize: 14, color: Color(0xFF9BA2B1))),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 13.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    child: Text(
                      'Mot de Passe',
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
                      child: formpass(),
                    ),
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    child: Text(
                      'Confirmer Mot de Passe',
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
                    // padding: EdgeInsets.only(top: 3, left: 8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: textforPassword(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("$email   $password");

                        signUp();
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
                      'Inscription',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                            width: 52,
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1)))),
                        const SizedBox(
                          width: 3.0,
                        ),
                        Text(
                          'ou',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 3.0,
                        ),
                        Container(
                            width: 52,
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1)))),
                      ],
                    ),
                    width: 150,
                    margin: const EdgeInsets.only(left: 70),
                    // color: Colors.red,
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await AuthService().signWithGoogle();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => pageAcceuil())));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEDEDEF),
                      padding: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      minimumSize: const Size(264, 50),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 30),
                            child: Image.asset('images/googleimages.png')),
                        // <-- Use 'Image.asset(...)' here
                        // SizedBox(width: 12),
                        // <-- Use 'Image.asset(...)' here

                        Container(
                          margin: const EdgeInsets.only(right: 47, top: 3),
                          child: Text(
                            'Coninuer avec google',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  TextFormField formpass() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _textEditingPassword,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade200, width: 2),
            borderRadius: BorderRadius.circular(15.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
            borderRadius: BorderRadius.circular(15.0)),
        hintText: 'Your password',
        hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF9BA2B1)),
        // border: InputBorder.none,
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.length < 6) {
          return 'le mot de passe doit contenir au moins 6 caractéres';
        }

        return null;
      },
      onChanged: (value) => password = value,
    );
  }

  TextFormField textforPassword() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade200, width: 2),
              borderRadius: BorderRadius.circular(15.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
              borderRadius: BorderRadius.circular(15.0)),
          hintText: 'Confirm password',
          // border: InputBorder.none,
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF9BA2B1))),
      obscureText: true,
      validator: (value) {
        if (confirmPassword != password) {
          return 'les deux mots de passent ne c\'orrespondent pas';
        }

        return null;
      },
      onChanged: (value) => confirmPassword = value,
    );
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _textEditingController.text.trim(),
              password: _textEditingPassword.text.trim())
          .then((value) {
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => page_connexion()));
      });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
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

  TextFormField textform() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade200, width: 2),
              borderRadius: BorderRadius.circular(15.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
              borderRadius: BorderRadius.circular(15.0)),
          hintText: 'E.g. John Smith',
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF9BA2B1))),
      validator: (value) {
        if (value!.isEmpty) {
          return 'le champ ne doit pas etre vide';
        }
        return null;
      },
      onChanged: (value) => nomComplet = value,
    );
  }
}
