import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/authentification/page_inscription.dart';
import 'package:flutter_application_1/screen/authentification/reset_password.dart';
import 'package:flutter_application_1/services/authServices.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

import '../home_page_4.dart';
import '../pageAcceuil.dart';

class page_connexion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/green1.png',
                  width: double.infinity,
                ),
                Positioned(
                  top: 47,
                  left: 10,
                  child: IconButton(
                      onPressed: (() => Get.to(connexion_inscription())),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 41,
                      )),
                ),
                Positioned(
                  top: 84,
                  left: 120,
                  child: Container(
                    // color: Colors.red,
                    height: 150,
                    margin: EdgeInsets.only(top: 12),
                    child: Image.asset(
                      'images/logo.png',
                    ),
                  ),
                ),
              ],
            ),
            Card(
              // color: Colors.red,
              margin: const EdgeInsets.only(top: 40),
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25))),

              shadowColor: Colors.white,
              child: SizedBox(
                width: 310,
                height: 415,
                child: Container(
                  margin: EdgeInsets.only(top: 18),
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      fomulaire_connexion(),
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

class fomulaire_connexion extends StatefulWidget {
  // final VoidCallback onClickedSignUp;
  const fomulaire_connexion({super.key});

  @override
  State<fomulaire_connexion> createState() => _fomulaire_connexionState();
}

class _fomulaire_connexionState extends State<fomulaire_connexion> {
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingPassword = TextEditingController();

  bool isEmailCorrcet = false;
  @override
  void dispose() {
    _textEditingController.dispose();
    _textEditingPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    margin: EdgeInsets.only(left: 6),
                    child: Text(
                      'Email',
                      style: GoogleFonts.roboto(
                          color: const Color(0xFF38385E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    height: 50,
                    width: 264,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      child: TextFormField(
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
                                        ? Colors.red.shade200
                                        : Colors.green.shade200,
                                    width: 2),
                                borderRadius: BorderRadius.circular(15.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.shade200, width: 2),
                                borderRadius: BorderRadius.circular(15.0)),
                            // border: InputBorder.none,
                            hintText: 'Jonh@gmail.com',
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Color(0xFF9BA2B1))),
                        validator: (value) {
                          if (isEmailCorrcet == false) {
                            if (value == null || value.isEmpty) {
                              return 'le champ ne doit pas etre vide';
                            }
                            return 'verifiez l\'ecriture de votre email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    child: Text(
                      'Mot de Passe',
                      style: GoogleFonts.roboto(
                          color: const Color(0xFF38385E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 13),
                    height: 50,
                    width: 264,
                    padding: EdgeInsets.only(top: 3, left: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEDEF),
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _textEditingPassword,
                      decoration: InputDecoration(
                          hintText: 'Your password',
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              fontSize: 13, color: Color(0xFF9BA2B1))),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Entrer minimun 6 caractéres';
                        }

                        return null;
                      },
                      onChanged: (value) => password = value,
                    ),
                  ),
                  Container(
                    height: 26,
                    // color: Colors.red,
                    margin: const EdgeInsets.only(right: 7),
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => reset_password()));
                      }),
                      child: Text('Mot de passe oublié ?',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("$email   $password");
                        signIn();
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
                      'Connexion',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  // forgetPassword(),

                  SizedBox(
                    height: 3,
                  ),
                  SignUpOption()
                ],
              ),
            ],
          )),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _textEditingController.text.trim(),
              password: _textEditingPassword.text.trim())
          .then((value) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => pageAcceuil()));
      });
      //  .onError((error, stackTrace) {
      //   print('Eror'${error.toString()});
      // });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Row SignUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Vous n\'avez pas de Compte ?   ',
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: (() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => page_inscription()));
          }),
          child: Text('Inscrivez-vous',
              style: GoogleFonts.roboto(
                  decoration: TextDecoration.underline,
                  color: Colors.green,
                  fontSize: 11,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  Widget forgetPassword() {
    return Container(
      color: Colors.red,
      // width: MediaQuery.of(context).size.width,
      height: 15,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text(' oublié ?',
            textAlign: TextAlign.right,
            style: GoogleFonts.roboto(
                // decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.bold)),
        onPressed: () {},
      ),
    );
  }
}
