import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screen/pageAcceuil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'liste_carte.dart';

class depotsCarte extends StatefulWidget {
  const depotsCarte({super.key});

  @override
  State<depotsCarte> createState() => _depotsCarteState();
}

class _depotsCarteState extends State<depotsCarte> {
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
              // backgroundColor: Color.fromARGB(255, 1, 70, 3),
              color: Colors.white,
              // activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 131, 200, 133),
              tabs: [
                GButton(
                  onPressed: (() => Get.to(pageAcceuil())),
                  icon: Icons.home,
                  iconSize: 30,
                  text: 'Acceuil',
                ),
                GButton(
                    icon: Icons.qr_code_scanner,
                    iconSize: 30,
                    text: 'Signaler'),
                GButton(
                    icon: Icons.newspaper_sharp, iconSize: 30, text: 'Actu'),
                GButton(
                    icon: Icons.account_circle, iconSize: 30, text: 'Compte')
              ]),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('Bienvenue  ${user?.email}'),
          carteMaps(),
        ],
      ),
    );
  }
}

class carteMaps extends StatefulWidget {
  const carteMaps({super.key});

  @override
  State<carteMaps> createState() => _carteMapsState();
}

class _carteMapsState extends State<carteMaps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (() {
                    onTap:
                    Get.to(depotsCarte());
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 2, 109, 2),
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                    ),
                    minimumSize: const Size(140, 44),
                  ),
                  child: Text(
                    'Carte',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ElevatedButton(
                  onPressed: (() {
                    Get.to(listeDepots());
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    minimumSize: const Size(140, 44),
                  ),
                  child: Text(
                    'Liste',
                    style: GoogleFonts.roboto(
                        color: Color(0xFF78829D),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFF008000)),
          )
        ],
      ),
    );
  }
}
