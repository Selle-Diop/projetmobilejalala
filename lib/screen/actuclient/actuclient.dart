import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../pageAcceuil.dart';
import '../page_signalement.dart';
import 'detailsclient.dart';

class actuClient extends StatefulWidget {
  const actuClient({super.key});

  @override
  State<actuClient> createState() => _actuClientState();
}

class _actuClientState extends State<actuClient> {
  int number = 5;
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
                  onPressed: (() => Get.to(pageAcceuil())),
                ),
                GButton(
                    icon: Icons.qr_code_scanner,
                    iconSize: 30,
                    onPressed: (() => Get.to(pageSignalement())),
                    text: 'Signaler'),
                GButton(
                    icon: Icons.newspaper_sharp, iconSize: 30, text: 'Actu'),
                GButton(
                    icon: Icons.account_circle, iconSize: 30, text: 'Compte')
              ]),
        ),
      ),
      body: Column(children: [
        Stack(
          children: [
            Image.asset(
              'images/green1.png',
              width: double.infinity,
            ),
            Positioned(
              top: 90,
              left: 90,
              child: Text(
                'Mes Commandes',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Client',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'N°Commande',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'Action',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        ListView.builder(
            itemCount: number,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Container(
                child: ListTile(
                  leading: Container(
                      margin: EdgeInsets.only(left: 14, top: 3),
                      child: Text('issa sall')),
                  title: Center(child: Container(child: Text('34546'))),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Get.to(detailClient());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF008000),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0)),
                      minimumSize: const Size(50, 30),
                    ),
                    child: Text(
                      'Details',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              );
            }))
      ]),
    );
  }
}
