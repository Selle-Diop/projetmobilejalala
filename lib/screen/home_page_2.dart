import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page_1.dart';
import 'home_page_3.dart';
import 'home_page_4.dart';

class MyHome_Page_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'images/sensibilisation.png',
              // color: Color.fromRGBO(0, 0, 0, 0.2865),
              // colorBlendMode: BlendMode.softLight,
            ),

            // ignore: avoid_unnecessary_containers
            Container(
              margin: const EdgeInsets.only(top: 40),
              // child: Image.asset('images/Dechets.png'),
              child: Image.asset('images/logo.png'),
            ),
          ],
        ),
        Card(
            margin: const EdgeInsets.only(bottom: 10),
            elevation: 4,
            shadowColor: Colors.white, // Change this
            // shadowColor: Color.fromARGB(210, 255, 255, 255),
            // color: Colors.red,
            child: SizedBox(
                width: 336,
                height: 400,
                child: Container(

                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      children: [
                        Text(
                          'Bienvenue sur Jalala Maps',
                          style: GoogleFonts.roboto(
                              color: Colors.green,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        // const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.only(top: 18),
                          child: Text(
                            'Participez aux actions de nettoyage',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 18, right: 215),
                          width: 82,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.black, width: 3))),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 21),
                          child: Text(
                            'Recevez des nitifications pour participer aux actions de nettoyage.',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 31),
                          width: 81,
                          height: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color.fromRGBO(
                                      231, 241, 255, 0.906),
                                ),
                              ),
                              Container(
                                width: 25,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green,
                                ),
                              ),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color.fromRGBO(
                                      231, 241, 255, 0.906),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),
                        Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => Get.off(homePage_1()),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFF9F9FB),
                                      side: const BorderSide(
                                          width: 1,
                                          color: const Color(0xFFA6B3B4)),
                                      padding: const EdgeInsets.all(13.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13.0)),
                                      minimumSize: const Size(130, 10),
                                    ),
                                    child: Text(
                                      'Précédent',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => Get.to(homePage_3()),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 5, 119, 9),
                                      padding: const EdgeInsets.all(13.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13.0)),
                                      minimumSize: const Size(130, 10),
                                    ),
                                    child: Text(
                                      'Suivant',
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => Get.to(connexion_inscription()),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                    width: 1, color: Colors.green),
                                padding: const EdgeInsets.all(13.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.0)),
                                minimumSize: const Size(270, 10),
                              ),
                              child: Text(
                                'Démarrer',
                                style: GoogleFonts.roboto(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ))))
      ]),
    );
  }
}
