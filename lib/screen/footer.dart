import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/actuclient/actuclient.dart';
import 'package:flutter_application_1/screen/pageAcceuil.dart';
import 'package:flutter_application_1/screen/page_signalement.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class footer extends StatelessWidget {
  const footer({super.key});

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
                  onPressed: (() => Get.to(pageAcceuil())),
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
                    onPressed: (() => Get.to(actuClient())),
                    text: 'Actu'),
                GButton(
                    icon: Icons.account_circle, iconSize: 30, text: 'Compte')
              ]),
        ),
      ),
    );
  }
}
