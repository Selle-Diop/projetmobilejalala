import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/actuclient/actuclient.dart';
import 'package:flutter_application_1/screen/page_signalement.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'depots_carte.dart';

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
      bottomNavigationBar: Container(
        color: Color(0xFF008000),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              gap: 8,
              onTabChange: (index) {
                print(index);
              },
              padding: const EdgeInsets.all(8),
              backgroundColor: const Color(0xFF008000),
              color: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 131, 200, 133),
              tabs: [
                GButton(
                  icon: Icons.home,
                  iconSize: 30,
                  text: 'Acceuil',
                ),
                GButton(
                    icon: Icons.qr_code_scanner,
                    iconSize: 30,
                    onPressed: (() => Get.to(pageSignalement())),
                    text: 'Signaler'),
                GButton(
                  icon: Icons.newspaper_sharp,
                  iconSize: 30,
                  text: 'Actu',
                  onPressed: (() => Get.to(actuClient())),
                ),
                GButton(
                    icon: Icons.account_circle, iconSize: 30, text: 'Compte')
              ]),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('Bienvenue  ${user?.email}'),
          Acceuil(),
        ],
      ),
    );
  }
}

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 697,
                child: Image.asset(
                  'images/envi2.png',
                  fit: BoxFit.cover,
                  // height: double.infinity,
                  color: const Color.fromARGB(0, 0, 0, 1).withOpacity(0.6),
                  colorBlendMode: BlendMode.softLight,
                ),
              ),
              Positioned(
                top: 60,
                left: 15,
                child: SizedBox(
                  height: 87,
                  width: 87,
                  // child: Image.asset('images/Dechets.png'),
                  child: Image.asset('images/logo.png'),
                ),
              ),
              Positioned(
                top: 69,
                right: 26,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                  ),
                ),
              ),
              Positioned(
                  top: 165,
                  left: 20,
                  child: Column(children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: (() => Get.to(depotsCarte())),
                          child: Image.asset('images/depot_sauvage.png'),
                        ),
                      ),
                      height: 90,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                    ),
                    Container(
                      height: 49,
                      width: 150,
                      child: Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          'Dépots Sauvages',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFF008000),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                    )
                  ])),
              Positioned(
                  top: 165,
                  right: 20,
                  child: Column(children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: (() => Get.to(depotsCarte())),
                          child: Image.asset('images/poubeille.png'),
                        ),
                      ),
                      height: 90,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          'Dépots Normés',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      height: 49,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Color(0xFF008000),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                    )
                  ])),
              // --------2eme ligne--------
              Positioned(
                  top: 335,
                  left: 20,
                  child: Column(children: [
                    Container(
                      child: IconButton(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 17),
                        icon: Icon(
                          Icons.chair_outlined,
                          // color: Colors.green,
                          size: 60,
                        ),
                        onPressed: () {
                          Get.to(depotsCarte());
                        },
                      ),
                      height: 90,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          'Encombrant',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      height: 49,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Color(0xFF008000),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                    )
                  ])),
              Positioned(
                  top: 335,
                  right: 20,
                  child: Column(children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: (() => Get.to(depotsCarte())),
                          child: Image.asset('images/encombrant.png'),
                        ),
                      ),
                      height: 90,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          'Cannaux Bouchés',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      height: 49,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Color(0xFF008000),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                    )
                  ])),
              //----- --------3eme ligne----------------------
              Positioned(
                  top: 505,
                  left: 20,
                  child: Column(children: [
                    Container(
                      height: 90,
                      width: 150,
                      child: Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(pageSignalement());
                          },
                          child: Image.asset('images/nettoyage.png'),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          'Demande de nettoyage',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      height: 49,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Color(0xFF008000),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                    )
                  ])),
              Positioned(
                  top: 505,
                  right: 20,
                  child: Column(children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset('images/whatsapp.png'),
                        ),
                      ),
                      height: 90,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 14),
                        child: Text(
                          'Sensibilisation',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      height: 49,
                      width: 150,
                      decoration: const BoxDecoration(
                        color: Color(0xFF008000),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                    )
                  ])),
            ],
          )
        ],
      ),
    );
  }
}
