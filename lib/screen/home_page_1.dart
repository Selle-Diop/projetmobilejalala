import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page_2.dart';
import 'home_page_4.dart';

class homePage_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'images/imageenvi.png',
            ),

            // ignore: avoid_unnecessary_containers
            Container(
              margin: const EdgeInsets.only(top: 40),
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
                            'Signalez les zones polluées de votre ville',
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
                          margin: const EdgeInsets.only(top: 18),
                          child: Text(
                            'Contribuez à assainir votre ville en partageant les photos des zones polluées(dépotoirs sauvages, caniveaux bouchés...).',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 81,
                          height: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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

                        const SizedBox(height: 23),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () => Get.to(MyHome_Page_2()),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 5, 119, 9),
                                padding: const EdgeInsets.all(13.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.0)),
                                minimumSize: const Size(290, 10),
                              ),
                              child: Text(
                                'Suivant',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: (() =>
                                  Get.to(connexion_inscription())),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                    width: 1, color: Colors.green),
                                padding: const EdgeInsets.all(13.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.0)),
                                minimumSize: const Size(290, 10),
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
