import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'authentification/page_connexion.dart';
import 'authentification/page_inscription.dart';
import 'home_page_3.dart';

class connexion_inscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            // alignment: Alignment.center,
            children: [
              Container(
                height: 783,
                child: Image.asset(
                  'images/envi2.png',
                  fit: BoxFit.cover,
                  // height: double.infinity,
                  color: Color.fromARGB(0, 0, 0, 1).withOpacity(0.6),
                  colorBlendMode: BlendMode.softLight,
                ),
              ),
              Positioned(
                top: 60,
                left: 12,
                child: IconButton(
                    onPressed: (() => Get.to(homePage_3())),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 41,
                    )),
              ),
              Positioned(
                top: 134,
                left: 120,
                child: Container(
                  // child: Image.asset('images/Dechets.png'),
                  child: Image.asset('images/logo.png'),
                ),
              ),
              Positioned(
                  top: 334,
                  left: 110,
                  child: Text(
                    'Bienvenue',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  )),
              Positioned(
                top: 490,
                left: 63,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: (() => Get.to(page_connexion())),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF008000),
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0)),
                        minimumSize: const Size(270, 59),
                      ),
                      child: Text(
                        'Connexion',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 50),
                    HoverClass()
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HoverClass extends StatefulWidget {
  const HoverClass({super.key});

  @override
  State<HoverClass> createState() => _HoverClassState();
}

class _HoverClassState extends State<HoverClass> {
  var isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: ElevatedButton(
        onPressed: (() => Get.to(page_inscription())),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
              width: 2, color: isHover ? Colors.green : Colors.white),
          padding: const EdgeInsets.all(8.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
          minimumSize: const Size(270, 59),
        ),
        child: Text(
          'Inscription',
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
